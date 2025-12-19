# Claude Code Plugins for Tenzir

This repository is a Claude Code plugin marketplace named `tenzir`. It contains
plugins that extend Claude's capabilities for working with the Tenzir ecosystem.

## Repository Structure

All plugins live in the `plugins/` subdirectory. The marketplace manifest
registers all available plugins. Each plugin maintains its own changelog.

```
claude-plugins/
├── .claude-plugin/
│   └── marketplace.json   # Marketplace manifest (MUST stay in sync)
├── changelog/             # Parent changelog (cross-cutting entries)
├── plugins/
│   ├── my-plugin/
│   │   ├── changelog/     # Plugin changelog
│   │   └── ...
│   └── ...
└── ...
```

## Adding a Plugin

Create a new directory in `plugins/` with the following structure:

```
plugins/<plugin-name>/
├── .claude-plugin/
│   └── plugin.json    # name, version, description
├── changelog/         # Plugin changelog
└── README.md
```

Then update `.claude-plugin/marketplace.json` to register it:

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

2. **Create a changelog entry** in `plugins/<plugin-name>/changelog/unreleased/`
   summarizing user-facing changes. Use the `/changelog:add` command for a
   guided workflow.

   For cross-cutting changes that affect multiple plugins or the marketplace
   itself, add entries to the parent `changelog/unreleased/` directory.

Do **not** bump the version during regular updates. Version bumps happen only
when releasing the plugin via `/changelog:release`.

## Releasing a Plugin

Use `/changelog:release` to release a plugin. Plugin releases:

- Stage the release and commit locally
- Do NOT create git tags or GitHub releases (the parent handles publishing)
- Update `plugins/<plugin-name>/.claude-plugin/plugin.json` to match the new
  version

The version in `plugin.json` must always match the latest released version in
`plugins/<plugin-name>/changelog/releases/`.

## Marketplace Manifest

The `.claude-plugin/marketplace.json` file defines this marketplace. It must
always reflect the current state of the `plugins/` directory. Each entry in the
`plugins` array should correspond to an actual plugin directory. Keep the
plugins sorted alphabetically by name.
