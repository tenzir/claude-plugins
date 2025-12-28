---
title: Pull Request Command
type: feature
authors:
  - mavam
  - claude
created: 2025-12-28T16:33:05Z
---

Add `/git:pr` command that creates GitHub pull requests. The command switches to
a topic branch, delegates to `/git:commit` for staging and committing, then
opens a PR using `gh pr create`. It reminds users to run project-specific
quality gates before creating the PR.

Also simplify `/git:commit` by removing the changelog and version bump
steps—use `/changelog:add` and `/changelog:release` separately.
