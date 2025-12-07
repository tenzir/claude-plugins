# Claude Code Plugins for Tenzir

This repository is a Claude Code plugin marketplace named `tenzir`. It contains
plugins that extend Claude's capabilities for working with the Tenzir ecosystem.

## Repository Structure

All plugins live in the `plugins/` subdirectory. The marketplace manifest
registers all available plugins.

```
claude-plugins/
├── .claude-plugin/
│   └── marketplace.json   # Marketplace manifest (MUST stay in sync)
├── plugins/
│   ├── my-plugin/         # A plugin
│   ├── another-plugin/    # Another plugin
│   └── ...
└── ...
```

## Adding a Plugin

Create a new directory in `plugins/`. Then update
`.claude-plugin/marketplace.json` to register it:

```json
{
  "plugins": [
    {
      "name": "plugin-name",
      "description": "What this plugin does",
      "source": "./plugins/<plugin-name>"
    }
  ]
}
```

## Updating a Plugin

When modifying an existing plugin, follow these steps:

1. **Make your changes** to the plugin files (e.g., `SKILL.md`, hooks, etc.)

2. **Bump the version** in `plugins/<plugin-name>/.claude-plugin/plugin.json`
   according to SemVer:
   - **Patch** (0.1.0 → 0.1.1): Bug fixes, typo corrections, minor wording
     improvements
   - **Minor** (0.1.0 → 0.2.0): New features (e.g., new skill, new slash
     command, new hook), backward-compatible enhancements
   - **Major** (0.1.0 → 1.0.0): Breaking changes (e.g., renamed skill,
     changed hook behavior, removed functionality)

3. **Create a changelog entry** summarizing user-facing changes.

## Marketplace Manifest

The `.claude-plugin/marketplace.json` file defines this marketplace. It must
always reflect the current state of the `plugins/` directory. Each entry in the
`plugins` array should correspond to an actual plugin directory. Keep the
plugins sorted alphabetically by name.

## Skills

**Always use the `writing-plugins` skill when creating or modifying plugins.**

This skill (from the `meta` plugin) contains essential guidance on plugin
structure, README templates, skill conventions, and marketplace registration.
It is auto-enabled for this repository.
