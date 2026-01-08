---
description: Commit changes with project-specific workflows
context: fork
model: haiku
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
separate commits, split them automatically:

1. Identify the distinct logical units
2. Unstage files not part of the first logical unit
3. Commit the first unit
4. Repeat until all changes are committed

If all staged changes form a single logical unit, proceed to the next step.

## 3. Lint

If the project has a linter configured, run it before committing.

## 4. Stage and commit

Stage changes and commit. Invoke `git:writing-commit-messages`.

Always create a new commit. Never amend unless the user explicitly requested it.
