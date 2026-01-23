---
title: Refactor code review to integrate GitHub PR feedback
type: breaking
authors:
  - mavam
  - claude
created: 2026-01-23T11:09:17.001629Z
---

The `addressing-pr-comments` skill has been replaced by the `@dev:reviewers:github` agent. This agent is now spawned automatically by `/review` when a PR exists, extracting unresolved GitHub comments as findings alongside the other code reviewers.

If you previously used the skill directly, use the GitHub reviewer agent instead or run `/review` on a branch with an open PR.

Other changes:

- The `reviewing-changes` skill now auto-creates the review directory via hook
- Added `GIT` prefix for GitHub findings in the issue ID table
