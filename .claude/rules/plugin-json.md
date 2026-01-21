---
paths: "**/plugin.json"
---

The `plugin.json` file defines the plugin:

```json
{
  "name": "plugin-name",
  "version": "0.0.0",
  "description": "Brief description of what this plugin does",
  "author": {
    "name": "Tenzir",
    "email": "engineering@tenzir.com",
    "url": "https://github.com/tenzir"
  },
  "homepage": "https://github.com/tenzir/claude-plugins",
  "repository": "https://github.com/tenzir/claude-plugins",
  "license": "Apache-2.0"
}
```

## Versioning

Plugins **must start at version `0.0.0`**. This allows the first release to use
standard bump flags (`--patch`, `--minor`, `--major`) to produce typical initial
versions like `0.0.1`, `0.1.0`, or `1.0.0`.

Follow SemVer when updating plugins:

- **Patch** (0.0.0 → 0.0.1): Bug fixes, typo corrections
- **Minor** (0.0.0 → 0.1.0): New features, backward-compatible enhancements
- **Major** (0.0.0 → 1.0.0): Breaking changes, production-ready
