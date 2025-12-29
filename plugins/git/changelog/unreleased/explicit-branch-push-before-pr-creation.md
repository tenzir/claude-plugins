---
title: Explicit branch push before PR creation
type: bugfix
authors:
  - mavam
  - claude
created: 2025-12-29T07:44:58.255845Z
---

The `/git:pr` command now explicitly pushes the current branch to origin before creating the pull request. This prevents the error "you must first push the current branch to a remote" that occurred when `gh pr create` attempted to create a PR from an unpushed branch.

Previously, the command relied on `gh pr create` to push automatically, but this behavior was unreliable. The command now uses `git push -u origin HEAD` to ensure the branch exists on the remote before invoking `gh pr create`.
