This release introduces the OCSF plugin for navigating the Open Cybersecurity Schema Framework with versioned reference documentation, and the Excalidraw plugin for generating valid diagrams. It also adds a reusable GitHub Action for automated changelog entries in CI.

Breaking changes include removing the meta and auto-update plugins from the marketplace.

## 💥 Breaking changes

### Meta plugin removed from marketplace

The meta plugin provided guidance for managing plugins in this marketplace. Since it was self-referential and only useful within this repository, the `managing-plugins` skill has been moved to `.claude/skills/` as a project-level skill.

Users who had `meta@tenzir` enabled should remove it from their settings. The validation script now detects stale plugin references in `.claude/settings.json` to prevent this issue in the future.

*By @mavam and @claude.*

## 🚀 Features

### Excalidraw diagram generation plugin

Generate valid Excalidraw diagrams with the new `excalidraw:diagramming` skill. The skill provides comprehensive reference documentation for all element types (shapes, text, arrows, lines, freedraw, images, frames, polygons) and styling properties (colors, fill patterns, positioning, grouping). All values and constants are derived from the Excalidraw source code, ensuring compatibility with excalidraw.com and VS Code extensions.

*By @mavam and @claude.*

### OCSF plugin with understanding-ocsf skill

The OCSF plugin provides comprehensive schema navigation for the Open Cybersecurity Schema Framework through the `understanding-ocsf` skill. The skill guides users through five core OCSF concepts: attributes, objects, classes, profiles, and extensions, with detailed documentation for each.

Reference documentation is dynamically generated from schema.ocsf.io covering all stable versions from 1.0.0 to 1.7.0. The generator fetches versioned schemas and creates Markdown references for 83 event classes and 170 object types, organized by the 8 OCSF categories (System, Findings, IAM, Network, Discovery, Application, Remediation, Unmanned). Progressive disclosure is achieved through hierarchical index files that link from the main index to version-specific indices to individual class and object documentation.

Generated references are excluded from git due to their size (approximately 2.6 MB across 8 versions), and users run the generation script as needed after installation.

*By @mavam and @claude.*

### Reusable GitHub Action for automated changelog entries

A reusable GitHub Action enables automated changelog entry creation for pull requests. The action uses the `changelog:adder` agent to analyze PR changes, determine if they are user-facing, and create appropriate changelog entries.

The action is idempotent, skipping execution if an entry already exists for the PR. After creating an entry, it posts a formatted comment to the PR with metadata and sync instructions for both Git and Jujutsu workflows.

Other repositories can integrate this action into their CI workflows by referencing `tenzir/claude-plugins/.github/actions/changelog-adder@main` and providing a Claude Code OAuth token.

*By @mavam and @claude in #2.*

## 🔧 Changes

### README documentation standards and validation

Plugin READMEs now follow stricter documentation standards with validation.

The documentation script extracts title, description, features, and usage sections from READMEs. New requirements ensure consistency:

- **Intro paragraph**: 2-3 sentences after the title, kept up to date when plugins change
- **Features section**: Required with emoji-prefixed bullet points highlighting what the plugin provides
- **Usage section**: Required with real-world examples showing how to use each component
- **Heading style**: Standardized on `## ✨ Features` and `## 🚀 Usage`

The validation script now enforces these requirements, catching missing sections and incorrect heading styles. This is important because the documentation at [docs.tenzir.com](https://docs.tenzir.com) relies on this structure.

*By @mavam and @claude.*

---

## Changelog Plugin v1.4.1

- 🚀 Non-interactive changelog entry creation for CI automation — *@mavam and @claude* (#1)
- 🔧 Clearer release staging instructions — *@mavam and @claude*
- 🔧 Improved context gathering for changelog entries — *@mavam and @claude*
- 🔧 Relative versioning in release workflow — *@mavam and @claude*
- 🔧 Updated release command for tenzir-changelog v0.17.2 — *@mavam and @claude*
- 🐞 Improved release workflow with project type detection and local temp files — *@mavam and @claude*
- 🐞 More accurate terminology in changelog add command — *@mavam and @claude*

## C++ Plugin v0.3.0

- 🚀 C++ coding conventions skill — *@mavam, @jachris, and @claude* (#3)
- 🚀 C++ plugin with clangd language server integration — *@mavam and @claude*

## Docs Plugin v2.2.0

- 💥 Renamed writing skill to authoring — *@mavam and @claude*
- 🚀 Cross-referencing PR command
- 🚀 Documentation reader subagent — *@mavam and @claude*
- 🚀 Fully autonomous documentation writer — *@mavam and @claude*
- 🚀 Intelligent documentation sync hook — *@mavam and @claude*
- 🐞 Automatic clone of documentation repository — *@mavam and @claude*
- 🐞 Synchronize documentation repository before writing — *@mavam and @claude*

## Excalidraw Plugin v0.1.0

- 🚀 Initial release — *@mavam and @claude*

## Formatter Plugin v1.1.1

- 🚀 YAML linting support — *@mavam and @claude*
- 🔧 EditorConfig support for shell script formatting — *@mavam and @claude*

## Git Plugin v1.2.0

- 🚀 Pull Request Command — *@mavam and @claude*
- 🚀 Slash command to address PR review comments — *@mavam and @claude*
- 🐞 Explicit branch push before PR creation — *@mavam and @claude*
- 🐞 Multi-line review comment support in address-pr-comments command — *@mavam and @claude*

## OCSF Plugin v0.1.0

- 🚀 Lazy OCSF reference generation — *@mavam and @claude*
- 🚀 OCSF guide subagent for schema questions — *@mavam and @claude*
- 🚀 Versioned profile references and external resource integration — *@mavam and @claude*
- 🔧 Versioned classes and objects overviews — *@mavam and @claude*

## Python Plugin v1.1.0

- 🚀 Add Pyright language server integration — *@mavam and @claude*

## TQL Plugin v1.1.1

- 🚀 TQL program authoring skill with documentation lookup — *@mavam and @claude*
- 🔧 Removed bundled MCP server — *@mavam and @claude*
