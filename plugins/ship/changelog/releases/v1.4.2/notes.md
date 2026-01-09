This release enhances the changelog commands with autonomous decision-making capabilities. Both `/changelog:add` and `/changelog:release` now run in forked contexts that infer parameters from repository context and proceed without user confirmation, streamlining the changelog and release workflows.

## 🔧 Changes

### Autonomous changelog entry creation

The `/changelog:add` command now runs in a forked context with autonomous decision-making. It infers entry type, title, and description from repository context without prompting, and aborts with clear explanations when context is insufficient rather than creating placeholder entries.

The separate `adder` subagent has been removed since the command now handles autonomous execution directly.

*By @mavam and @claude.*

### Autonomous release workflow

The `/changelog:release` command now runs in a forked context with autonomous decision-making. It infers the version bump type from unreleased entries (or accepts an optional `bump` argument), automatically generates release titles and intros, and proceeds without user confirmation. The command aborts with clear explanations when pre-release checks fail.

The separate `releaser` subagent has been removed since the command now handles autonomous execution directly.

*By @mavam and @claude.*
