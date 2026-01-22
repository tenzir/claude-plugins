---
description: Run parallel code review on changes
context: fork
model: sonnet
hooks:
  PreToolUse:
    - matcher: "*"
      hooks:
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/detect-review-scope.sh"
          once: true
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/create-review-dir.sh"
          once: true
---

# Review Changes

Spawn specialized reviewers in parallel to analyze changes.

## 1. Setup (via hooks)

Two hooks run automatically before the first tool call:

1. **Scope detection** → outputs scope, diff command, and files:
   - `Scope: <description>` — what's being reviewed
   - `Diff: <command>` — git diff command base (append files to run)
   - File list, one per line
2. **Review directory** → creates and outputs the path:
   - `Review directory: <path>` — where reviewers write findings

Use the hook outputs for scope, diff command, file list, and review directory.
To review a different scope, stage or unstage changes and run the command again.

## 2. Explore Project Context

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

Launch all reviewer agents in parallel using the Task tool. Pass the project
context from the Explore agent, file list, and review directory:

- `@dev:reviewers:ux` - User experience, clarity, discoverability
- `@dev:reviewers:docs` - Documentation quality, accuracy
- `@dev:reviewers:tests` - Test coverage, edge cases
- `@dev:reviewers:arch` - API design, modularity, complexity
- `@dev:reviewers:security` - Input validation, injection, secrets
- `@dev:reviewers:readability` - Naming quality, idiomatic patterns, clarity
- `@dev:reviewers:performance` - Performance, complexity, resource efficiency

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

Merge findings that flag the same location from different reviewers. Multiple
reviewers flagging the same area signals importance—note this when presenting.

### Correlate

Group related findings that touch the same subsystem or share a root cause.
Addressing one may resolve others.

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

### Display Format

```markdown
## Review Summary

**4 findings** to address (7 total from 5 reviewers)

🔴 P1 · 🛡️ SEC-1 · SQL injection vulnerability (95%) · src/db.ts:45
🟠 P2 · 🏗️ ARC-1 · Circular dependency (88%) · src/modules/a.ts:12
🟠 P2 · 👁️ RDY-1 · Unclear function name (82%) · src/utils.ts:30
🟡 P3 · 🧪 TST-1 · Missing edge case (85%) · src/handler.ts:78

🔴 P1 · 🟠 P2 · 🟡 P3 · ⚪ P4
🛡️ security · 🏗️ arch · 🧪 tests · 🎨 ux · 👁️ readability · 📖 docs · 🚀 performance
```

Format: `{severity_emoji} {severity} · {category_emoji} {id} · {title} ({confidence}%) · {file}:{lines}`

Sort by urgency: severity (P1→P4), then confidence (descending).

## 6. Prompt to Address

If **findings exist**:

> 📁 Full findings: `<review_dir>/`
>
> Address these? (**yes** to enter plan mode)

If user responds **yes**:

1. Enter plan mode with findings as context
2. Re-read full reviewer outputs (`<review_dir>/*.md`) for reasoning, evidence,
   and suggestions—the summary is a distillation, not the full picture
3. Generate implementation plan ordered by severity (P1 first)
4. Group fixes by file to minimize context switches

If user responds **no** or **no findings**:
