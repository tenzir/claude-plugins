---
title: Worktree isolation for documentation repository clones
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-21T09:15:23.741438Z
---

The docs plugin now properly isolates `.docs/` clones across git worktrees, preventing the `docs:writer` agent from discovering and using another worktree's `.docs/` directory instead of cloning its own copy.

The fix includes three improvements:

- **Init hook runs on first tool call**: Updated hook matchers in `write.md`, `review.md`, and `pr.md` to use `*` for the initialization hook, ensuring `.docs/` is cloned before any tool executes
- **Clear error messages on clone failure**: The `synchronize-docs.sh` script now blocks with an actionable message if the clone fails, helping users diagnose SSH key or network issues
- **Explicit isolation guidance**: Added instructions to `writer.md` telling the agent not to search for `.docs/` in other locations, reinforcing the one-clone-per-worktree design

This resolves scenarios where multiple worktrees would inadvertently share a single `.docs/` clone, causing documentation changes to appear in unexpected locations.
