---
description: Fetch latest and create topic branch or worktree
argument-hint: "[worktree]"
context: fork
model: haiku
---

# Prepare for Work

Fetch the latest from origin and create a fresh starting point. You can work in
two modes:

- **Topic branch** (default): Create a new branch in the current worktree
- **Worktree**: Create a new git worktree in `../worktrees/<branch>` with its
  own working directory

Use `/ship:prepare` for a topic branch or `/ship:prepare worktree` for a
separate worktree.

## 1. Fetch Latest

Fetch the latest changes from origin.

## 2. Create Working Context

**Default (topic branch):**

Create a new topic branch from the main branch in the current directory.

**With `worktree` argument:**

Create a new git worktree at `../worktrees/<branch-name>` with a topic branch
checked out. This keeps the main worktree clean for other work.

## 3. Report

Confirm the branch name and working directory.
