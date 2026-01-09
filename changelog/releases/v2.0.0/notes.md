This major release renames the `changelog` plugin to `ship` to better reflect its focus on release engineering. Subagents now require explicit skill declarations in their YAML frontmatter, and tool configurations have been updated to use the consolidated `Skill` tool.

## 💥 Breaking changes

### Changelog plugin renamed to ship

The `changelog` plugin has been renamed to `ship` to better reflect its broader focus on release engineering. Users who have installed the `changelog` plugin should update their configuration to use `ship` instead.

*By @mavam and @claude.*

## 🚀 Features

### Explicit skill declarations for subagents

Subagents now explicitly declare required skills in their YAML frontmatter using the `skills:` field. This change aligns with Claude Code's updated behavior where subagents no longer inherit skills from the parent conversation.

The validation script now verifies that all skill references in agent definitions point to existing skills, catching broken references before deployment.

*By @mavam and @claude.*

## 🔧 Changes

### Changelog-adder action uses tenzir-changelog for PR comments

The changelog-adder GitHub Action now uses `tenzir-changelog` to render PR comments instead of manual frontmatter parsing. This fixes two formatting issues: a trailing separator when the `created` field is missing, and hard-wrapped body text that rendered with explicit line breaks.

The action also supports multiple changelog entries per PR. When a PR adds entries across several plugins, all entries appear in a single comment with proper headings and attribution links.

*By @mavam and @claude in #4.*

### Initial plugin version set to 0.0.0 for proper first release bumping

The plugin template now specifies `0.0.0` as the initial version, enabling the first release to use standard bump flags (`--patch`, `--minor`, `--major`) to produce typical initial versions like `0.0.1`, `0.1.0`, or `1.0.0`.

*By @mavam and @claude.*

### Updated tool configurations to use Skill instead of SlashCommand

The `SlashCommand` tool has been merged into the `Skill` tool in recent Claude Code versions. This updates tool configurations in the changelog adder GitHub Action and the docs writer agent to reflect this change, removing the redundant `SlashCommand` reference while keeping `Skill`.

*By @mavam and @claude.*

---

## Docs Plugin v2.2.1

- 🐞 Complete example reporting in documentation reader — *@mavam and @claude*
- 🐞 Stricter documentation reader behavior — *@mavam and @claude*

## Excalidraw Plugin v0.1.1

- 🔧 Bidirectional arrow binding documentation — *@mavam and @claude*
- 🔧 Enhanced diagramming documentation for technical limitations — *@mavam and @claude*
- 🔧 Font selection defaults for diagram text — *@mavam and @claude*
- 🔧 Triangle arrowhead as default — *@mavam and @claude*
- 🐞 Artist sloppiness as default for arrows and polygons — *@mavam and @claude*
- 🐞 Correct polygon path closing instructions — *@mavam and @claude*
- 🐞 Correct text positioning formula for containers — *@mavam and @claude*
- 🐞 Diagram generation improvements — *@mavam and @claude*

## Formatter Plugin v1.2.0

- 🚀 ESLint support for JavaScript and TypeScript — *@mavam and @claude*

## Git Plugin v1.3.0

- 🔧 Autonomous commit workflow — *@mavam and @claude*
- 🔧 Expanded static checks in commit workflow — *@mavam and @claude*
- 🔧 Immediate push after each PR comment fix — *@mavam and @claude*
- 🔧 Pre-commit linting step — *@mavam and @claude*

## OCSF Plugin v0.1.1

- 🔧 Pre-commit OCSF references with automated updates — *@mavam and @claude* (#4)
- 🔧 Sonnet model for guide agent — *@mavam and @claude*
- 🐞 Content-based sync for OCSF documentation — *@mavam and @claude*

## Ship Plugin v2.0.0

- 💥 Plugin renamed from changelog to ship — *@mavam and @claude*
- 🚀 Add `/changelog:release` command — *@mavam and @claude*
- 🚀 Add changelog add command to plugin — *@mavam and @claude*
- 🚀 Add releaser subagent to changelog plugin — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*
- 🚀 Non-interactive changelog entry creation for CI automation — *@mavam and @claude* (#1)
- 🔧 Add Markdown formatting best practice — *@mavam*
- 🔧 Autonomous changelog entry creation — *@mavam and @claude*
- 🔧 Autonomous release workflow — *@mavam and @claude*
- 🔧 Clearer release staging instructions — *@mavam and @claude*
- 🔧 Document extension.toml for version bumping — *@mavam and @claude*
- 🔧 Document multi-value flags and human author requirement — *@mavam*
- 🔧 Fail-fast validation and clarified module detection in release command — *@mavam and @claude*
- 🔧 Improve changelog skill discoverability — *@mavam and @claude*
- 🔧 Improve component awareness in changelog workflow — *@mavam and @claude*
- 🔧 Improve releaser agent reliability with Sonnet model and process guardrails — *@mavam and @claude*
- 🔧 Improved context gathering for changelog entries — *@mavam and @claude*
- 🔧 Improved release title documentation — *@mavam and @claude*
- 🔧 Improved tenzir-changelog CLI documentation — *@mavam and @claude*
- 🔧 Plain text titles in changelog entries — *@mavam and @claude*
- 🔧 Relative versioning in release workflow — *@mavam and @claude*
- 🔧 Release workflow simplified with clearer module release handling — *@mavam and @claude*
- 🔧 Technical writing skill reference in `/changelog:add` command — *@mavam and @claude*
- 🔧 Updated release command for tenzir-changelog v0.17.2 — *@mavam and @claude*
- 🔧 Use --co-author for AI-assisted development — *@mavam and @claude*
- 🔧 Use `--description-file` instead of `--description` — *@mavam*
- 🐞 Always pass --description to skip interactive editor — *@mavam*
- 🐞 Clarify entry type selection criteria in changelog skill — *@mavam and @claude*
- 🐞 Clarify publish step to use release notes for preview — *@mavam and @claude*
- 🐞 Correct argument handling in ship commands — *@mavam and @claude*
- 🐞 Fix release command documentation — *@mavam*
- 🐞 Improved release workflow with project type detection and local temp files — *@mavam and @claude*
- 🐞 More accurate terminology in changelog add command — *@mavam and @claude*

## TQL Plugin v1.2.0

- 🚀 Parser and OCSF mapping workflows — *@mavam and @claude*
