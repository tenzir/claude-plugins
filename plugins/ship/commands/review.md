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

## 2. Spawn Reviewers

Launch all 6 reviewer agents **in parallel** using the Task tool. Pass the file
list from scope detection to each agent in the prompt:

- `@ship:reviewer-ux` - User experience, clarity, discoverability
- `@ship:reviewer-docs` - Documentation quality, accuracy
- `@ship:reviewer-tests` - Test coverage, edge cases
- `@ship:reviewer-arch` - API design, modularity, complexity
- `@ship:reviewer-security` - Input validation, injection, secrets
- `@ship:reviewer-consistency` - Naming, code style, patterns

Pass files as a comma-separated list of backtick-quoted paths:

> Review these files: `src/foo.ts`, `src/bar.ts`

Wait for all reviewers to complete. Each writes findings to `.review/<aspect>.md`.

## 3. Collect and Display Findings

Read all `.review/*.md` files. Parse findings by extracting lines with
confidence scores in brackets (e.g., `### [95] Finding title`).

Filter to confidence 80+. Display a summary table:

```markdown
## Review Findings

| Score | Reviewer | Finding                           |
| ----- | -------- | --------------------------------- |
| 95    | security | Hardcoded API key in config       |
| 88    | tests    | Missing edge case for empty input |
| 82    | arch     | Tight coupling between modules    |
```

## 4. Report Results

If **actionable findings exist** (confidence 80+):

- Display the findings summary

If **no actionable findings**:

- Display "No actionable findings" message

## 5. Clean Up

Remove the review directory:

```sh
rm -rf .review/
```
