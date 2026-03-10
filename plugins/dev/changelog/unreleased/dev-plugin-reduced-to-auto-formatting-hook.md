---
title: Dev plugin reduced to auto-formatting hook
type: breaking
authors:
  - mavam
  - claude
created: 2026-03-10T16:12:00Z
---

The `dev` plugin now only provides the automatic file-formatting hook for edited files. All commands, agents, skills, and supporting workflow scripts have been removed from the plugin.

The removed `dev` skills are superseded by the new [tenzir/skills](https://github.com/tenzir/skills) repository.
