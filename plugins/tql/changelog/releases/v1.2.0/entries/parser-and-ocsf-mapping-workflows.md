---
title: Parser and OCSF mapping workflows
type: feature
authors:
  - mavam
  - claude
created: 2026-01-05T17:39:16.99755Z
---

Two new slash commands guide you through creating Tenzir packages:

- `/tql:make_parser` walks through 5 phases to create a parsing pipeline from
  sample log data, with iterative testing via `tenzir-test`
- `/tql:make_ocsf_mapping` adds OCSF mapping to an existing parser, validating
  output with `ocsf::cast`

Both commands work without the MCP server, using manual file operations and the
`tenzir-test` CLI. The new `tql:managing-packages` skill provides package
structure guidance.
