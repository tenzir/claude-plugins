---
description: Commit changes with project-specific workflows
---

# Commit Changes

## 1. Gather context

Run `git status`, `git diff`, and `git log --oneline -5` to understand changes.

## 2. Analyze change cohesion

Examine staged changes to identify distinct logical units. Look for:

- Changes to unrelated features or components
- Mixed refactoring and functional changes
- Bug fixes combined with new features
- Documentation updates alongside code changes

If staged changes contain **multiple orthogonal changes** that should be
separate commits:

1. Present a numbered list of the distinct changes detected
2. Use `AskUserQuestion` to let the user select which change to commit first
3. Proceed with only the selected change—unstage files not part of that change
4. After committing, inform the user about remaining unstaged changes

If all staged changes form a single logical unit, proceed to the next step.

## 3. Stage and commit

Stage changes and commit. Invoke `git:writing-commit-messages`.

If it's unclear whether to amend the last commit or create a new one, ask the user.
