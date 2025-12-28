This release adds support for non-interactive changelog entry creation, enabling CI automation workflows where Claude can automatically generate changelog entries from PR context. It also improves the release workflow with better project type detection and local temporary file handling.

## 🚀 Features

### Non-interactive changelog entry creation for CI automation

The `changelog:adder` agent enables non-interactive changelog entry creation for CI automation. When users comment `@claude add a changelog entry` on a PR with the Claude GitHub App installed, Claude automatically analyzes the PR and creates an appropriate changelog entry.

The agent autonomously determines the entry type, title, and description based on PR context, making it ideal for automated workflows.

*By @mavam and @claude in #1.*

## 🐞 Bug fixes

### Improved release workflow with project type detection and local temp files

The release command now uses a `detect-project-type.sh` script to identify project types (python, rust, node, cpp) and conditionally executes project-specific sections using `<project type="...">` XML tags.

Temporary files moved from `/tmp` to local dotfiles (`.changelog-description.md`, `.intro.md`) with explicit cleanup instructions after successful operations. This avoids `Write` tool errors when writing outside the project sandbox.

*By @mavam and @claude.*
