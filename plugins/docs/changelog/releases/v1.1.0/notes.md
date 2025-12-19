# Docs Plugin v1.1.0

This release introduces autonomous documentation workflows with the new `/docs:review` command and `docs:writer` subagent. The plugin now uses `.docs` as the unconditional documentation root and streamlines command naming by renaming `/docs:write-docs` to `/docs:write`.

## 🚀 Features

### Add /docs:review command for documentation review

Introduces the `/docs:review` command to review documentation changes for completeness and style. The command:

- Identifies changes in the `.docs/` directory
- Starts the local preview server for live verification
- Checks completeness using the `docs:writing` skill
- Reviews writing style using the `prose:technical-writing` skill
- Summarizes findings and offers to fix identified issues

This integrates seamlessly into the documentation workflow as the second step after `/docs:write`.

*By @mavam and @claude.*

### Autonomous documentation workflow with write and review

The `docs:writer` subagent autonomously handles the documentation workflow by executing `/docs:write` followed by `/docs:review`. It halts after the review phase to let users inspect the results before deciding to create a PR. The subagent makes autonomous decisions about section selection, style fixes, and completeness gaps.

*By @mavam and @claude.*

## 🔧 Changes

### Rename write-docs command to write

The `/docs:write-docs` command has been renamed to `/docs:write` for consistency with the plugin naming convention. Since the command is already prefixed by the plugin name (`docs:`), the redundant `write-docs` was simplified to just `write`.

*By @mavam and @claude.*

### Unconditional documentation root at .docs

The docs plugin now unconditionally uses `.docs` as the documentation root instead of attempting to detect it. This simplifies the plugin's behavior and removes the dependency on the `detect-docs-root.sh` script, which has been deleted. Commands and skills have been updated to reference `.docs` directly throughout the documentation.

*By @mavam and @claude.*
