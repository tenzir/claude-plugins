# First Stable Release

This is the first stable release of the Tenzir Claude Marketplace, a collection of plugins that extend Claude Code's capabilities for working with the Tenzir ecosystem.

This release introduces fully qualified skill names across all plugins for clarity and consistency. The `writing` plugin has been renamed to `prose` to better reflect its purpose, and the auto-update plugin has been removed in favor of manual updates. The CI now validates all skills using the official Agent Skills specification.

## 💥 Breaking changes

### Remove auto-update plugin

Remove the auto-update plugin as it was ineffective. The plugin ran on session start, but the current session already has old plugin code loaded, so updates only take effect on the next session. This made the automation pointless.

Users can manually run `claude plugin marketplace update tenzir` when they want to update the marketplace.

*By @mavam and @claude.*

### Renamed `writing` plugin to `prose`

The `writing` plugin is now `prose` to better reflect its purpose: style guidelines for technical prose across different contexts (documentation, error messages, CLI output, etc.).

All references to `writing:technical-writing` are now `prose:technical-writing`.

*By @mavam and @claude.*

### Use fully qualified skill names throughout plugins

All skill references now use fully qualified names (`plugin:skill-name` format) for clarity and consistency.

The following skills were renamed to follow the gerund naming convention and avoid redundancy with the plugin name prefix:

- `changelog-management` → `managing-entries`
- `writing-documentation` → `writing`

Affected references across plugins:

- `git:writing-commit-messages`
- `brand:styling-tenzir-ui`
- `changelog:managing-entries`
- `docs:writing`
- `meta:managing-plugins`
- `python:python-conventions`
- `prose:technical-writing`

*By @mavam and @claude.*

## 🚀 Features

### Skill validation in CI using agentskills skills-ref

The CI now validates all plugin skills using the official `skills-ref` tool from the [agentskills](https://github.com/agentskills/agentskills) project. This validation runs in parallel with the existing plugin structure validation, ensuring skills conform to the Agent Skills specification.

*By @mavam and @claude.*

## 🔧 Changes

### Add color properties to subagents

The `releaser` subagent now uses green and the `committer` subagent uses yellow for visual distinction in the CLI.

*By @mavam and @claude.*

### Automatically load meta:managing-plugins skill for plugin development

Add a rule that automatically loads the `meta:managing-plugins` skill when working with files in the `plugins/` directory. This improves the developer experience by ensuring the essential plugin management guidance is always available when creating, modifying, or reviewing plugins.

*By @mavam and @claude.*

### Clarify plugin release publishing responsibilities

Clarified that plugin releases do not create git tags or GitHub releases. Plugin releases now stage and commit locally, with the parent project handling publishing. Updated documentation to reflect this responsibility boundary.

*By @mavam and @claude.*

### Document plugin version synchronization requirement

The `plugin.json` version must match the latest released version in the plugin's `changelog/releases/` directory. When releasing via `/changelog:release`, update `plugin.json` accordingly.

*By @mavam and @claude.*

### Expand commit command guidance

The `/git:commit` command now provides more actionable guidance for project-specific requirements. Each requirement (changelog entries, version bumps, validation steps) includes specific instructions on what to look for and how to proceed.

*By @mavam and @claude.*

### Improve skill descriptions for better discoverability

Skill descriptions now include more action-based triggers (running tools, editing files) alongside file-based triggers for better discoverability. Also removes time-sensitive wording from python-conventions.

*By @mavam and @claude.*

### Improve skill discoverability with artifact-based triggers

Rename skills and update descriptions to trigger on artifact detection rather than specific user queries:

- `writing-python-code` → `python-conventions`: triggers on Python repository or `pyproject.toml`/`uv.lock`/`ruff.toml`/`.py` files
- `managing-changelogs` → `changelog-management`: triggers on changelog questions or `changelog/` directory

*By @mavam.*

### Update commit command to use /changelog:add slash command

Reference the /changelog:add slash command instead of invoking the changelog skill directly for a guided workflow.

*By @mavam and @claude.*

### Use AskUserQuestion in release command

The `/release` command now explicitly references `AskUserQuestion` for user prompts, matching the pattern established in `/commit`.

*By @mavam and @claude.*

### Version synchronization validation in plugin validation script

The plugin validation script now enforces that the `version` field in each plugin's `plugin.json` matches the latest released version in its `changelog/releases/` directory. This validation catches mismatches between the declared plugin version and the actual released version, helping maintain consistency across the plugin marketplace.

*By @mavam and @claude.*

## 🐞 Bug fixes

### Broaden managing-plugins skill triggers

The skill description now emphasizes "editing ANY file in the plugins/ directory" and explicitly mentions "bumping plugin versions" as a trigger, making it clearer when the skill should be loaded.

*By @mavam and @claude.*

---

## Brand Plugin v1.0.0

- 🚀 Add brand plugin with Tenzir design system — *@mavam and @claude*
- 🚀 Add official SVG logo assets — *@mavam and @claude*
- 🚀 Expand badge color palette to match tags — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*
- 🚀 Standardize CSS custom properties with --tnz- prefix — *@mavam and @claude*

## Changelog Plugin v1.2.0

- 🚀 Add `/changelog:release` command — *@mavam and @claude*
- 🚀 Add changelog add command to plugin — *@mavam and @claude*
- 🚀 Add releaser subagent to changelog plugin — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*
- 🔧 Add Markdown formatting best practice — *@mavam*
- 🔧 Document extension.toml for version bumping — *@mavam and @claude*
- 🔧 Document multi-value flags and human author requirement — *@mavam*
- 🔧 Improve changelog skill discoverability — *@mavam and @claude*
- 🔧 Improve component awareness in changelog workflow — *@mavam and @claude*
- 🔧 Improve releaser agent reliability with Sonnet model and process guardrails — *@mavam and @claude*
- 🔧 Improved release title documentation — *@mavam and @claude*
- 🔧 Improved tenzir-changelog CLI documentation — *@mavam and @claude*
- 🔧 Plain text titles in changelog entries — *@mavam and @claude*
- 🔧 Release workflow simplified with clearer module release handling — *@mavam and @claude*
- 🔧 Technical writing skill reference in `/changelog:add` command — *@mavam and @claude*
- 🔧 Use --co-author for AI-assisted development — *@mavam and @claude*
- 🔧 Use `--description-file` instead of `--description` — *@mavam*
- 🐞 Always pass --description to skip interactive editor — *@mavam*
- 🐞 Clarify entry type selection criteria in changelog skill — *@mavam and @claude*
- 🐞 Clarify publish step to use release notes for preview — *@mavam and @claude*
- 🐞 Fix release command documentation — *@mavam*

## Docs Plugin v1.1.0

- 💥 Refactor docs plugin workflow: remove agent, add dedicated commands — *@mavam and @claude*
- 🚀 Add /docs:review command for documentation review — *@mavam and @claude*
- 🚀 Add path detection to docs plugin — *@mavam and @claude*
- 🚀 Autonomous documentation workflow with write and review — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*
- 🔧 Rename write-docs command to write — *@mavam and @claude*
- 🔧 Simplify docs plugin directory name to .docs — *@mavam and @claude*
- 🔧 Unconditional documentation root at .docs — *@mavam and @claude*
- 🔧 Use SSH URL for docs repository clone — *@mavam and @claude*

## Formatter Plugin v1.0.0

- 🚀 Initial release — *@mavam and @claude*
- 🐞 Add MDX file support to formatter hook — *@mavam and @claude*
- 🐞 Use portable shebang in formatter hook — *@mavam and @claude*

## Git Plugin v1.0.0

- 🚀 Add /commit slash command — *@mavam*
- 🚀 Add committer subagent — *@mavam*
- 🚀 Initial release — *@mavam and @claude*
- 🚀 Prompt for orthogonal staged changes — *@mavam and @claude*
- 🔧 Reference changelog skill in /commit command — *@mavam and @claude*
- 🐞 Fix unqualified skill reference in git plugin README — *@mavam and @claude*
- 🐞 Improve skill trigger for commit requests — *@mavam*

## Meta Plugin v1.1.0

- 💥 Rename writing-plugins skill to managing-plugins — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*
- 🔧 Document composability principle for subagents — *@mavam and @claude*
- 🔧 Document description duplication requirement — *@mavam and @claude*
- 🔧 Refactor managing-plugins skill with progressive disclosure — *@mavam*

## Prose Plugin v1.0.0

- 🚀 Add writing plugin for technical documentation — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*
- 🐞 Fix unqualified skill reference in writing plugin README — *@mavam and @claude*

## Python Plugin v1.0.0

- 💥 Rename `python-conventions` skill to `following-conventions` — *@mavam and @claude*
- 💥 Replace `/python:release` with `/changelog:release` — *@mavam and @claude*
- 🚀 Add dependency upgrade guide for Python plugin — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*

## TQL Plugin v1.0.0

- 🚀 Add tql plugin — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*
- 🔧 Update tql plugin to use tenzir-mcp@latest — *@mavam and @claude*
