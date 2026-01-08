---
title: Autonomous release workflow
type: change
authors:
  - mavam
  - claude
created: 2026-01-08T20:55:15.254571Z
---

The `/changelog:release` command now runs in a forked context with autonomous decision-making. It infers the version bump type from unreleased entries (or accepts an optional `bump` argument), automatically generates release titles and intros, and proceeds without user confirmation. The command aborts with clear explanations when pre-release checks fail.

The separate `releaser` subagent has been removed since the command now handles autonomous execution directly.
