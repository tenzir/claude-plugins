---
title: Autonomous changelog entry creation
type: change
authors:
  - mavam
  - claude
created: 2026-01-08T18:36:05.887124Z
---

The `/changelog:add` command now runs in a forked context with autonomous decision-making. It infers entry type, title, and description from repository context without prompting, and aborts with clear explanations when context is insufficient rather than creating placeholder entries.

The separate `adder` subagent has been removed since the command now handles autonomous execution directly.
