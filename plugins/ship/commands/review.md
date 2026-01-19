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

1. **Scope detection** → outputs files to review:
   - If staged changes exist → review staged only
   - Else if unstaged or untracked files exist → review those
   - Else → review branch changes since merge-base with main
2. **Review directory** → creates `.reviews/<date>/<session_id>/`

Use the scope output for the file list and the review directory for findings.
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

- `@ship:reviewers:ux` - User experience, clarity, discoverability
- `@ship:reviewers:docs` - Documentation quality, accuracy
- `@ship:reviewers:tests` - Test coverage, edge cases
- `@ship:reviewers:arch` - API design, modularity, complexity
- `@ship:reviewers:security` - Input validation, injection, secrets
- `@ship:reviewers:readability` - Naming quality, idiomatic patterns, clarity
- `@ship:reviewers:perf` - Performance, complexity, resource efficiency

Pass each reviewer its to-be-reviewed files as list of backtick-quoted paths,
and include the review direcotry:

> ## Project
>
> Description about the project, allowing for calibration of relevance of
> findings.
>
> ## Scope
>
> Review these files: `src/foo.ts`, `src/bar.ts`
>
> ## Findings
>
> Write findings to: `<review_dir>/<aspect>.md`

Wait for all reviewers to complete.

## 4. Collect and Display Findings

Read all `<review_dir>/*.md` files. These contain the complete review with all
findings. Parse findings by extracting lines matching `### P{n} · title · {n}%`.

### Parsing

Extract from each finding header:

- **Severity**: `P1`, `P2`, `P3`, or `P4` from `### P{n}`
- **Title**: Text between the two dots
- **Confidence**: Percentage from `· {n}%`
- **Reviewer**: Derived from filename (e.g., `security.md` → `security`)

### Action Emoji

Compute action emoji from severity and confidence:

| Emoji | Label     | Logic                                   |
| ----- | --------- | --------------------------------------- |
| 🔴    | critical  | P1-P2 with 80%+ confidence              |
| 🟠    | important | P1 with <80% conf, or P3 with 80%+ conf |
| 🟡    | minor     | P2-P3 with <80% conf, or P4 with 80%+   |
| ⚪    | optional  | P4 with <80% confidence                 |

### Category Emoji

| Category    | Emoji |
| ----------- | ----- |
| security    | 🛡️    |
| arch        | 🏗️    |
| tests       | 🧪    |
| ux          | 🎨    |
| readability | 👁️    |
| docs        | 📖    |
| perf        | 🚀    |

### Display Format

Filter to confidence 80+ and display as compact inline format:

```markdown
## Review Findings

🔴 P1 🛡️ SQL injection in user input handler (92%)
🔴 P2 🛡️ Missing authentication check (88%)
🟠 P3 🏗️ Inconsistent error handling (85%)
🟡 P3 🧪 Missing edge case for empty input (82%)
🟡 P4 👁️ Unclear variable name obscures intent (80%)
⚪ P4 🚀 Unbounded loop in data processor (75%)

Legend: 🔴 critical · 🟠 important · 🟡 minor · ⚪ optional
Categories: 🛡️ security · 🏗️ arch · 🧪 tests · 🎨 ux · 👁️ readability · 📖 docs · 🚀 perf
```

Format: `{action_emoji} {severity} {category_emoji} {finding} ({confidence}%)`

### Sorting

Sort findings by:

1. Label priority: 🔴 → 🟠 → 🟡 → ⚪
2. Severity: P1 → P2 → P3 → P4
3. Confidence: descending

## 5. Report Results

If **actionable findings exist** (confidence 80+):

- Display the findings summary
- Report the review directory path where full reviews are saved

If **no actionable findings**:

- Display "No actionable findings" message
- Report the review directory path where full reviews are saved
