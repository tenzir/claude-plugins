---
description: Run parallel code review on changes
context: fork
model: sonnet
---

# Review Changes

Spawn specialized reviewers in parallel to analyze changes.

## 1. Detect Scope

Determine what to review using auto-detection:

```sh
staged=$(git diff --cached --name-only)
unstaged=$(git diff --name-only)
```

**Priority:**

1. If staged changes exist → review staged only
2. Else if unstaged changes exist → review unstaged
3. Else → review branch (since merge-base)

Report the detected scope to the user before spawning reviewers. To review a
different scope, stage or unstage changes accordingly and run the command again.

## 2. Create Review Directory

Create a persistent review directory with hierarchical structure:

```sh
date_dir=$(date +%Y-%m-%d)
session_id="${CLAUDE_SESSION_ID:-$(date +%H%M%S)}"
review_dir=".reviews/$date_dir/$session_id"
mkdir -p "$review_dir"
```

## 3. Spawn Reviewers

Launch all 7 reviewer agents **in parallel** using the Task tool. Pass the file
list and review directory to each agent in the prompt:

- `@ship:reviewers:ux` - User experience, clarity, discoverability
- `@ship:reviewers:docs` - Documentation quality, accuracy
- `@ship:reviewers:tests` - Test coverage, edge cases
- `@ship:reviewers:arch` - API design, modularity, complexity
- `@ship:reviewers:security` - Input validation, injection, secrets
- `@ship:reviewers:readability` - Naming quality, idiomatic patterns, clarity
- `@ship:reviewers:perf` - Performance, complexity, resource efficiency

Pass files as a comma-separated list of backtick-quoted paths, and include the
review directory:

> Review these files: `src/foo.ts`, `src/bar.ts`
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

| Emoji | Action      | Logic                                   |
| ----- | ----------- | --------------------------------------- |
| 🔴    | Act now     | P1-P2 with 80%+ confidence              |
| 🟠    | Investigate | P1 with <80% conf, or P3 with 80%+ conf |
| 🟡    | Consider    | P2-P3 with <80% conf, or P4 with 80%+   |
| ⚪    | Optional    | P4 with <80% confidence                 |

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

Legend: 🔴 act now · 🟠 investigate · 🟡 consider · ⚪ optional
Categories: 🛡️ security · 🏗️ arch · 🧪 tests · 🎨 ux · 👁️ readability · 📖 docs · 🚀 perf
```

Format: `{action_emoji} {severity} {category_emoji} {finding} ({confidence}%)`

### Sorting

Sort findings by:

1. Action priority: 🔴 → 🟠 → 🟡 → ⚪
2. Severity: P1 → P2 → P3 → P4
3. Confidence: descending

## 5. Report Results

If **actionable findings exist** (confidence 80+):

- Display the findings summary
- Report the review directory path where full reviews are saved

If **no actionable findings**:

- Display "No actionable findings" message
- Report the review directory path where full reviews are saved
