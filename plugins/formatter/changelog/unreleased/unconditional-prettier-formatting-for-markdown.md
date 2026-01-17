---
title: Unconditional Prettier formatting for Markdown
type: change
authors:
  - mavam
  - claude
created: 2026-01-17T11:39:01.22893Z
---

Prettier now runs unconditionally on Markdown files when installed, without
requiring a `.prettierrc` configuration file. This ensures consistent table
alignment and formatting across all projects.

The documentation now includes a "Config Required" column in the tools table,
making it clear which formatters run unconditionally and which need project
configuration.
