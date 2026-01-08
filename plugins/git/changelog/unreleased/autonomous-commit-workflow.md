---
title: Autonomous commit workflow
type: change
authors:
  - mavam
  - claude
created: 2026-01-08T18:36:08.038302Z
---

The `/git:commit` command now runs in a forked context with autonomous decision-making. When staged changes contain multiple unrelated modifications, the command automatically splits them into separate commits without prompting. It always creates new commits rather than amending unless explicitly requested.

The separate `committer` subagent has been removed since the command now handles autonomous execution directly.
