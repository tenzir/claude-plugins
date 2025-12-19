# Changelog Plugin v1.1.0

This release improves documentation and guidance across the changelog plugin. Updates include better CLI usage examples with correct flag positioning, enhanced release title documentation, and clearer guidance on writing plain text titles for changelog entries. All improvements focus on helping users follow best practices when managing changelogs.

## 🔧 Changes

### Improved release title documentation

The `/changelog:release` command now includes guidance on crafting release titles and shows the `--title` flag in the staging example.

*By @mavam and @claude.*

### Improved tenzir-changelog CLI documentation

The `/changelog:add` command and managing-entries skill documentation have been improved with corrected tenzir-changelog CLI usage. The `--root` flag is now positioned before the `add` subcommand, and output examples have been updated to use the `--json` flag for structured data instead of `--markdown`. These changes ensure users follow the correct CLI syntax and prefer machine-readable output formats.

*By @mavam and @claude.*

### Plain text titles in changelog entries

Changelog titles now have explicit guidance to use plain text without markdown formatting. Titles appear in tables and feeds where markdown isn't rendered, so backticks and other formatting should be reserved for the body.

*By @mavam and @claude.*

### Technical writing skill reference in `/changelog:add` command

The `/changelog:add` command now references the `prose:technical-writing` skill for general style guidance.

*By @mavam and @claude.*
