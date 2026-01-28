---
title: Reviewer improvements
type: enhancement
authors:
  - mavam
  - claude
created: 2026-01-23T17:30:00.000000Z
---

The plan reviewer agent has been renamed from `@dev:plan-reviewer` to `@dev:reviewers:plan` for naming consistency with other reviewers.

The `/dev:review` command now selects reviewers intelligently based on the actual diff content. The model reads the diff and decides which reviewers are relevant, skipping those that clearly have nothing to review. The `github` reviewer is spawned only when a PR exists.
