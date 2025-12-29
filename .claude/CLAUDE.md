# Claude Code Plugins for Tenzir

This repository is a Claude Code plugin marketplace named `tenzir`.

## Managing Plugins

The `managing-plugins` skill provides detailed guidance for plugin structure,
metadata, and components. It loads automatically when working in `plugins/`.

## Workflows

### Adding a Plugin

1. Create `plugins/<plugin-name>/` with required structure (see skill for details)
2. Register in `.claude-plugin/marketplace.json`
3. Update the plugin table in `README.md`
4. Run validation: `scripts/validate-plugins.sh`

### Updating a Plugin

1. Make your changes
2. Add changelog entry: `/changelog:add`

### Renaming or Removing a Plugin

1. Update or remove the entry in `.claude-plugin/marketplace.json`
2. Update the plugin table in `README.md`
3. Rename or remove the `plugins/<plugin-name>/` directory

### Releasing a Plugin

Use `/changelog:release`. This stages the release and updates `plugin.json`.
Do not create git tags or GitHub releases—the parent handles publishing.
