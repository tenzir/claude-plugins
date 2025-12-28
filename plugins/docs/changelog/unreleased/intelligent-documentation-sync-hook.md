---
title: Intelligent documentation sync hook
type: feature
authors:
  - mavam
  - claude
created: 2025-12-28T08:18:43.441119Z
---

A new `PreToolUse` hook automatically keeps the `.docs/` repository synchronized
when editing documentation files. The hook fetches updates only when the last
sync was more than 24 hours ago, avoiding unnecessary network operations.

The hook analyzes repository state to determine the safest action:

- Auto-pulls when on `main` with a clean worktree and fast-forward is possible
- Blocks edits and notifies Claude when merge conflicts are detected
- Detects merged topic branches that should be switched away from
