This is the first stable release of the meta plugin. It renames the skill from `writing-plugins` to `managing-plugins` to better reflect its scope, restructures the skill with progressive disclosure for better organization, and documents the description duplication requirement in the marketplace manifest.

## 💥 Breaking changes

### Rename writing-plugins skill to managing-plugins

The skill is now named `managing-plugins` instead of `writing-plugins`. Update any references to use the new name.

The skill description is also broadened to cover the full plugin lifecycle (create, modify, review, debug) and is no longer tied to the "tenzir marketplace" specifically.

*By @mavam and @claude.*

## 🔧 Changes

### Document description duplication requirement

The marketplace does not automatically read descriptions from `plugin.json`, so they must be duplicated in `marketplace.json` for plugin discovery.

*By @mavam and @claude.*

### Refactor managing-plugins skill with progressive disclosure

The managing-plugins skill now uses progressive disclosure with separate reference files for each plugin component type (skills, subagents, commands, hooks). The main SKILL.md links to these files, and Claude loads them as needed. Added guidance to use `@agent-claude-code-guide` for best practices.

*By @mavam.*
