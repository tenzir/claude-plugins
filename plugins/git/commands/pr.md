---
description: Create a pull request on GitHub for current changes
---

# Create Pull Request

> **Important**: All project-specific quality gates must pass before creating a
> PR. Check `CLAUDE.md` or project documentation for required linting,
> formatting, type checking, and build steps. Run these first and fix any
> failures.

At any step, if there are errors, report them and stop.

## 1. Verify changes

Run `git status` to identify uncommitted changes. If there are none, stop.

## 2. Switch to topic branch

If currently on `main` or `master`, switch to a new topic branch:

```sh
git switch -c topic/<brief-description>
```

Use a descriptive branch name based on the changes (e.g.,
`topic/add-user-validation`, `topic/fix-memory-leak`).

## 3. Commit changes

Execute `/git:commit` to stage and commit the changes.

## 4. Create PR

Create the PR with `gh` (pushes automatically):

```sh
gh pr create --title "..." --body "..."
```

The body should contain:

- A summary of what the PR does and why
- Any relevant context or design decisions
- Testing notes if applicable

Report the PR URL.
