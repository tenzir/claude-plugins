---
name: pr-maker
description: Create a pull request on GitHub for current changes.
tools: Read, Glob, Grep, Bash, Write, Skill, Task
model: haiku
color: blue
skills: dev:writing-commit-messages
---

# Create Pull Request

> **Important**: All project-specific quality gates must pass before creating a
> PR. Check `CLAUDE.md` or project documentation for required linting,
> formatting, type checking, and build steps. Run these first and fix any
> failures.

## 1. Verify changes

Run `git status` to identify uncommitted changes. If there are none, stop.

## 2. Switch to topic branch

If currently on `main` or `master`, switch to a new topic branch:

```sh
git switch -c topic/<brief-description>
```

## 3. Commit changes

Use `@dev:committer` to stage and commit the changes.

## 4. Create PR

Push and create the PR:

```sh
git push -u origin HEAD
gh pr create --title "..." --body "..."
```

The body should contain:

- A summary of what the PR does and why
- Any relevant context or design decisions
- Testing notes if applicable

Report the PR URL.
