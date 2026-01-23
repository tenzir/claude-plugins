---
title: Iterative workflow for addressing review findings
type: feature
authors:
  - mavam
  - claude
created: 2026-01-23T18:07:03.074089Z
---

New `/fix` command orchestrates an iterative workflow for addressing review findings one by one. Each fix runs in a dedicated `@dev:fixer` agent (Opus) that commits the change, pushes to the remote, and resolves GitHub threads automatically for GitHub findings (GIT-\* IDs).

This restores the iterative "fix, commit, reply, resolve" workflow that was lost when `/address-pr-comments` was converted to a reviewer agent. The new design generalizes to all reviewer findings—not just GitHub comments—and gives Opus fresh context for each fix without accumulated distractions.

The `/review` command now offers both `/fix` and plan mode options in its workflow. Both paths handle automatic resolution of GitHub threads after fixes are pushed.
