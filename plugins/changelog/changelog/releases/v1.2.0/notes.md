# Improved Release Workflow

This release introduces autonomous documentation workflows with the new `/docs:review` command and `docs:writer` subagent. The plugin now uses `.docs` as the unconditional documentation root and streamlines command naming by renaming `/docs:write-docs` to `/docs:write`.

## 🔧 Changes

### Document extension.toml for version bumping

Updated the release command documentation to include `extension.toml` in the list of version files to check during the version bump step. This ensures users are aware that Rust extension projects should update their `extension.toml` version alongside other version files like `Cargo.toml` and `plugin.json`.

*By @mavam and @claude.*

### Release workflow simplified with clearer module release handling

Release workflow simplified and clarified. The release command now consolidates module release logic into a single "Detect Release Context" section, distinguishing between standard and module releases. Steps 7-8 were streamlined to reduce redundancy. The releaser agent was refactored to focus only on orthogonal concerns (validation, autonomous decisions, error handling), removing duplicated workflow steps that belong to the slash command.

*By @mavam and @claude.*
