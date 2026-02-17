---
title: Shipping changes skill replaces finalize command and docs updater agent
type: breaking
authors:
  - mavam
  - claude
created: 2026-02-17T10:34:59.975511Z
---

The new `dev:shipping-changes` skill replaces the `/dev:finalize` command and the `@dev:docs-updater` agent with a unified workflow.

The skill detects the current branch and runs the appropriate mode:

- **Main mode** (on `main`): Adds a changelog entry, commits, and pushes.
- **Worktree mode** (on a topic branch): Commits, creates a draft PR, adds a changelog entry, commits again, and pushes.

For user-facing changes, the skill also handles documentation end-to-end—managing the `.docs/` checkout of `tenzir/docs`, creating a topic branch, spawning `@dev:docs-editor`, opening a docs PR, and cross-linking both PRs.
