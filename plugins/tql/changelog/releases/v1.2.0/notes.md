This release introduces two new slash commands for creating Tenzir packages: `/tql:make_parser` for building parsing pipelines from sample log data, and `/tql:make_ocsf_mapping` for adding OCSF mappings to existing parsers. Both commands provide guided, multi-phase workflows with iterative testing support.

## 🚀 Features

### Parser and OCSF mapping workflows

Two new slash commands guide you through creating Tenzir packages:

- `/tql:make_parser` walks through 5 phases to create a parsing pipeline from sample log data, with iterative testing via `tenzir-test`
- `/tql:make_ocsf_mapping` adds OCSF mapping to an existing parser, validating output with `ocsf::cast`

Both commands work without the MCP server, using manual file operations and the `tenzir-test` CLI. The new `tql:managing-packages` skill provides package structure guidance.

*By @mavam and @claude.*
