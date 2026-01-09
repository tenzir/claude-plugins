---
title: Updated tool configurations to use Skill instead of SlashCommand
type: change
authors:
  - mavam
  - claude
created: 2026-01-09T05:49:43.183526Z
---

The `SlashCommand` tool has been merged into the `Skill` tool in recent Claude Code versions. This updates tool configurations in the changelog adder GitHub Action and the docs writer agent to reflect this change, removing the redundant `SlashCommand` reference while keeping `Skill`.
