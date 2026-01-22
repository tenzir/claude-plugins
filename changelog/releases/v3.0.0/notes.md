This release consolidates several plugins into unified packages. The dev plugin now includes documentation, technical writing, git workflows, plan review, and auto-formatting. The tenzir plugin combines TQL and OCSF functionality.

A new emoji reaction-based changelog workflow lets you approve, reject, or modify changelog suggestions directly in PR comments using GitHub reactions.

## 💥 Breaking changes

### Git, plan, and formatter plugins merged into dev plugin

The git, plan, and formatter plugins have been consolidated into the dev plugin, creating a comprehensive developer utilities platform. This consolidation removes three separate plugins and unifies their capabilities within the dev plugin.

**Git workflows** are now part of dev:

- `@dev:committer` agent commits changes with automatic cohesion analysis to split orthogonal changes
- `@dev:pr-maker` agent creates pull requests on GitHub
- `dev:addressing-pr-comments` skill addresses PR review comments
- `dev:writing-commit-messages` skill guides cohesive commit messages

**Plan review** capabilities moved to dev:

- Plan review hooks (`review-plan.sh`, `notify-plan-review.sh`, `notify-review-start.sh`) now run as part of dev workflows
- Automated plan evaluation integrates with code review tools
- Review prompts and notifications are now scoped to the dev plugin

**Auto-formatting** workflows integrated:

- `format-hook.sh` and formatting logic now part of dev plugin
- Automatic formatting after Write and Edit operations
- Unified hook configuration for all dev-based operations

The consolidation maintains all existing functionality while providing a more cohesive experience for development workflows. Standalone projects and module-based projects continue to be supported.

*By @mavam and @claude.*

### Unified dev plugin replaces docs and prose

The `docs` and `prose` plugins have been consolidated into a new `dev` plugin. Users must update their plugin configuration to replace `docs@tenzir` and `prose@tenzir` with `dev@tenzir`.

The new `dev` plugin combines documentation workflows with technical writing guidance into a single plugin for developer utilities. The skills are now `dev:docs-authoring` and `dev:technical-writing`, and the documentation agent is `@dev:docs-updater`.

**Migration guide:**

Update your `.claude/settings.json` to replace the old plugins with the new one:

```diff
 "plugins": [
-  "docs@tenzir",
-  "prose@tenzir",
+  "dev@tenzir"
 ]
```

**Removed commands:**

The `/docs:write`, `/docs:review`, and `/docs:pr` commands have been removed. Use `@dev:docs-updater` instead for autonomous documentation workflows.

**Skill mapping:**

| Old                       | New                     |
| ------------------------- | ----------------------- |
| `docs:authoring`          | `dev:docs-authoring`    |
| `prose:technical-writing` | `dev:technical-writing` |

**Agent mapping:**

| Old            | New                 |
| -------------- | ------------------- |
| `@docs:writer` | `@dev:docs-updater` |

*By @mavam and @claude.*

### Unified tenzir plugin replaces tql and ocsf

The `tql` and `ocsf` plugins have been consolidated into a new unified `tenzir` plugin. Users must update their plugin configuration to replace `tql@tenzir` and `ocsf@tenzir` with `tenzir@tenzir`.

The new `tenzir` plugin combines all TQL and OCSF functionality into a single, cohesive experience with two workflow skills (`/tenzir:make-parser` and `/tenzir:make-ocsf-mapping`) and an OCSF subagent (`tenzir:ocsf`) for schema questions. This simplifies plugin management by reducing the number of plugins needed for Tenzir development workflows.

**Migration guide:**

Update your `.claude/settings.json` to replace the old plugins with the new one:

```diff
 "plugins": [
-  "tql@tenzir",
-  "ocsf@tenzir",
+  "tenzir@tenzir"
 ]
```

The `docs:reader` agent has been removed as it's superseded by general documentation lookup patterns.

*By @mavam and @claude.*

## 🚀 Features

### Emoji reaction-based changelog workflow

Changelog entries are now generated as suggestions in PR comments rather than automatically committed. You can approve, reject, or modify suggestions using GitHub emoji reactions.

React with 👍 to accept and commit the entry, 👎 to reject when no changelog is needed, or 😕 to regenerate with different content. Additional reactions let you adjust the style: 🚀 makes entries more technical, 👀 makes them simpler, and 😄 adds more wit.

The workflow polls reactions every minute and automatically applies your choice. This gives you control over changelog content before it's committed to your PR.

*By @mavam and @claude in #8.*

## 🐞 Bug fixes

### Updated documentation URLs after ship plugin rename

The documentation URLs in the ship and tql plugins now correctly reference `ship-framework.md` instead of the obsolete `changelog-framework.md`. This completes the transition from the old changelog plugin name to the new ship plugin name, ensuring all documentation links remain functional.

*By @mavam and @claude.*

---

## Dev Plugin v3.0.0

- 💥 Consolidated docs and prose into dev plugin — *@mavam and @claude*
- 💥 Refactor docs plugin workflow: remove agent, add dedicated commands — *@mavam and @claude*
- 💥 Renamed writing skill to authoring — *@mavam and @claude*
- 🚀 Add /docs:review command for documentation review — *@mavam and @claude*
- 🚀 Add path detection to docs plugin — *@mavam and @claude*
- 🚀 Autonomous documentation workflow with write and review — *@mavam and @claude*
- 🚀 Cross-referencing PR command
- 🚀 Documentation reader subagent — *@mavam and @claude*
- 🚀 Fully autonomous documentation writer — *@mavam and @claude*
- 🚀 Initial release — *@mavam and @claude*
- 🚀 Intelligent documentation sync hook — *@mavam and @claude*
- 🚀 Unified developer utilities with integrated changelog and code review — *@mavam and @claude*
- 🔧 Automated review setup with project context awareness — *@mavam and @claude*
- 🔧 Bun package manager support in command scripts — *@mavam and @claude*
- 🔧 Category indicators and refined reviewer specializations — *@mavam and @claude*
- 🔧 Command-scoped documentation synchronization hook — *@mavam and @claude*
- 🔧 Improved skill and agent descriptions with Use when pattern — *@mavam and @claude*
- 🔧 Intelligent synthesis and structured tracking for review findings — *@mavam and @claude*
- 🔧 Rename write-docs command to write — *@mavam and @claude*
- 🔧 Simplified severity display in review output — *@mavam and @claude*
- 🔧 Simplify docs plugin directory name to .docs — *@mavam and @claude*
- 🔧 Structured hook outputs for review workflow clarity — *@mavam and @claude*
- 🔧 Unconditional documentation root at .docs — *@mavam and @claude*
- 🔧 Unified documentation synchronization across all doc commands — *@mavam and @claude*
- 🔧 Use SSH URL for docs repository clone — *@mavam and @claude*
- 🐞 Automatic branch switching after merged documentation branches — *@mavam and @claude*
- 🐞 Automatic clone of documentation repository — *@mavam and @claude*
- 🐞 Complete example reporting in documentation reader — *@mavam and @claude*
- 🐞 Correct PR creation syntax in finalize command — *@mavam and @claude*
- 🐞 Stricter documentation reader behavior — *@mavam and @claude*
- 🐞 Synchronize documentation repository before writing — *@mavam and @claude*
- 🐞 Worktree isolation for documentation repository clones — *@mavam and @claude*

## Python Plugin v1.1.1

- 🔧 Expanded Python conventions guidance — *@lava* (#6)
