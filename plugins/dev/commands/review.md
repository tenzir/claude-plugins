---
description: Run parallel code review on changes. Use when reviewing a PR, checking code quality, or auditing changes.
context: fork
model: sonnet
hooks:
  PreToolUse:
    - matcher: "*"
      hooks:
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/detect-review-scope.sh"
          once: true
---

# Review Changes

Spawn specialized reviewers in parallel to analyze changes.

## 1. Setup (via hook)

A scope detection hook runs automatically before the first tool call. It outputs:

- `Scope: <description>` — what's being reviewed
- `Diff: <command>` — git diff command base (append files to run)
- File list, one per line

The review directory is created automatically when the first reviewer starts
writing findings (via a hook in the `reviewing-changes` skill).

To review a different scope, stage or unstage changes and run the command again.

## 2. Detect PR and Explore Context

### Check for PR

Check if the current branch has an associated pull request:

```sh
gh pr view --json number --jq '.number' 2>/dev/null
```

Note whether a PR exists—this determines if the GitHub reviewer should be spawned.

### Explore Project Context

Launch the Explore agent to gather project context before spawning reviewers.

Prompt:

> Briefly describe this project for code reviewers. Check the repository root
> for config files (package.json, Cargo.toml, pyproject.toml, Dockerfile, etc.)
> and skim the README intro.
>
> Return 2-3 sentences describing:
>
> - What the project is and does
> - Key characteristics relevant to code review (e.g., static site generator,
>   CLI tool, library, web service, build tooling)

Wait for the agent to complete and capture its output.

## 3. Spawn Reviewers

### Security Note

The GitHub reviewer uses `gh` CLI which inherits your authentication. Only run
on repositories you trust. If `GITHUB_TOKEN` is set (e.g., in CI), the reviewer
gains those permissions.

### Select Reviewers

Run the diff command from the hook output to see the actual changes. Based on
what you observe, select which reviewers to spawn:

- Skip reviewers that clearly have nothing to review
- When uncertain, include the reviewer—false negatives are worse than extra reviews
- Always include `github` if a PR exists

### Available Reviewers

- `@dev:reviewers:ux` - User experience, clarity, discoverability
- `@dev:reviewers:docs` - Documentation quality, accuracy
- `@dev:reviewers:tests` - Test coverage, edge cases
- `@dev:reviewers:arch` - API design, modularity, complexity
- `@dev:reviewers:security` - Input validation, injection, secrets
- `@dev:reviewers:readability` - Naming quality, idiomatic patterns, clarity
- `@dev:reviewers:performance` - Performance, complexity, resource efficiency
- `@dev:reviewers:github` - GitHub PR comments from humans and bots (only if PR exists)

### Launch Reviewers

Launch selected reviewer agents in parallel using the Task tool. Pass the
project context from the Explore agent, file list, and review directory.

Pass each reviewer a prompt constructed from hook outputs:

- File list and diff command base from `Diff:` line (append files to complete)
- Review directory from `Review directory:` line
- Replace `<reviewer>` with reviewer name (e.g., `security`, `ux`)

Template:

> ## Project
>
> Description about the project, allowing for calibration of relevance of
> findings.
>
> ## Scope
>
> Review changes in: `src/foo.ts`, `src/bar.ts`
>
> Diff command:
>
> ```sh
> git diff --cached -- src/foo.ts src/bar.ts
> ```
>
> ## Workflow
>
> 1. Run the diff command above to see the changed hunks
> 2. Focus your review on the changes shown in the diff
> 3. Read full file context only when needed to understand changes
> 4. Report line numbers from the original file, not diff output
>
> Note: With unstaged scope, files with no diff output are untracked (new)—review
> them in full.
>
> ## Findings
>
> Write findings to: `<review_dir>/<reviewer>.md`

Wait for all reviewers to complete.

## 4. Synthesize Findings

Read all `<review_dir>/*.md` files. You now have context that individual
reviewers lacked: all findings together, project context, and user intent.

Use this to distill actionable items:

### Deduplicate

You should merge findings that flag the same location from different reviewers.
Multiple reviewers flagging the same area signals importance—note this when
presenting.

### Correlate

You should group related findings that touch the same subsystem or share a root
cause. Addressing one may resolve others.

When GitHub reviewer feedback (GIT findings) aligns with automated reviewer
findings, this signals higher priority—human reviewers independently identified
the same concern.

### Prioritize

Given the project context and scope, determine what matters most:

- P1/P2 findings generally take precedence
- High confidence (90%+) signals strong evidence
- Multiple reviewers flagging related issues amplifies priority
- Consider user's likely intent from the review scope

### Select

Choose the top findings to present. Not everything needs action—filter noise,
keep signal. Aim for a focused list the user can reasonably address.

## 5. Display Findings

Present the synthesized findings.

### Emoji Reference

Severity:

| Severity | Emoji |
| -------- | ----- |
| P1       | 🔴    |
| P2       | 🟠    |
| P3       | 🟡    |
| P4       | ⚪    |

Category:

| Category    | Emoji |
| ----------- | ----- |
| security    | 🛡️    |
| arch        | 🏗️    |
| tests       | 🧪    |
| ux          | 🎨    |
| readability | 👁️    |
| docs        | 📖    |
| performance | 🚀    |
| github      | 💬    |

### Display Format

```markdown
## Review Summary

**5 findings** to address (8 total from 6 reviewers)

🔴 P1 · 🛡️ SEC-1 · SQL injection vulnerability (95%) · src/db.ts:45
🟠 P2 · 🏗️ ARC-1 · Circular dependency (88%) · src/modules/a.ts:12
🟠 P2 · 👁️ RDY-1 · Unclear function name (82%) · src/utils.ts:30
🟡 P3 · 🧪 TST-1 · Missing edge case (85%) · src/handler.ts:78
🟡 P3 · 💬 GIT-1 · Missing error handling (@alice) · src/api.ts:45

🔴 P1 · 🟠 P2 · 🟡 P3 · ⚪ P4
🛡️ security · 🏗️ arch · 🧪 tests · 🎨 ux · 👁️ readability · 📖 docs · 🚀 performance · 💬 github
```

Format: `{severity_emoji} {severity} · {category_emoji} {id} · {title} ({confidence}%) · {file}:{lines}`

For GitHub findings, include author attribution: `💬 GIT-1 · {title} (@{author})`

Sort by urgency: severity (P1→P4), then confidence (descending).

## 6. Prompt to Address

If **findings exist**:

> 📁 Full findings: `<review_dir>/`
>
> Options:
>
> - `/fix` — Fix findings one-by-one with commits (resolves GitHub threads)
> - **yes** — Enter plan mode to fix in bulk

If user runs `/fix`:

The `/fix` command reads findings from the review directory and processes
them interactively, creating a commit for each fix. For GitHub findings, it
also replies and resolves threads.

If user responds **yes**:

1. Enter plan mode with findings as context
2. Re-read full reviewer outputs (`<review_dir>/*.md`) for reasoning, evidence,
   and suggestions—the summary is a distillation, not the full picture
3. Generate implementation plan ordered by severity (P1 first)
4. Group fixes by file to minimize context switches
5. After fixes are pushed, resolve GitHub threads for any GIT-\* findings:

   For each GIT-\* finding with a thread ID, reply and resolve:

   ```sh
   gh api graphql -f query='
   mutation {
     addPullRequestReviewThreadReply(input: {
       pullRequestReviewThreadId: "THREAD_ID"
       body: "Addressed in COMMIT_SHA."
     }) { comment { id } }
   }'
   ```

   ```sh
   gh api graphql -f query='
   mutation {
     resolveReviewThread(input: {
       threadId: "THREAD_ID"
     }) { thread { isResolved } }
   }'
   ```

If user responds **no** or **no findings**:
