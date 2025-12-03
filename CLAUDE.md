# Claude Code Plugins for Tenzir

This repository is a Claude Code plugin marketplace named `tenzir`. It contains
plugins that extend Claude's capabilities for working with the Tenzir ecosystem.

## Repository Structure

Every top-level directory in this repository is a plugin. The marketplace
manifest registers all available plugins.

```
claude-plugins/
├── .claude-plugin/
│   └── marketplace.json   # Marketplace manifest (MUST stay in sync)
├── my-plugin/             # A plugin
├── another-plugin/        # Another plugin
└── ...
```

## Adding a Plugin

Create a new directory at the repository root. Then update
`.claude-plugin/marketplace.json` to register it:

```json
{
  "plugins": [
    {
      "name": "plugin-name",
      "description": "What this plugin does",
      "source": "./<plugin-name>"
    }
  ]
}
```

## Marketplace Manifest

The `.claude-plugin/marketplace.json` file defines this marketplace. It must
always reflect the current state of plugin directories. Each entry in the
`plugins` array should correspond to an actual plugin directory.
