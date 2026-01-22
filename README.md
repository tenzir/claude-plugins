# 🔌 claude-plugins

`claude-plugins` is a collection of plugins for [Claude
Code](https://code.claude.com) that extend its capabilities with custom
commands, agents, hooks, skills, and MCP servers tailored for working with
[Tenzir](https://tenzir.com).

## Plugins

| Plugin       | Description                                                                                         |
| ------------ | --------------------------------------------------------------------------------------------------- |
| `brand`      | Tenzir brand and style guidelines for frontend development                                          |
| `cpp`        | C++ language support, tooling, and coding conventions                                               |
| `dev`        | Developer utilities including documentation, changelogs, code review, git workflows, and formatting |
| `excalidraw` | Create Excalidraw diagrams with proper JSON structure                                               |
| `python`     | Python coding conventions for Tenzir projects                                                       |
| `tenzir`     | Authoritative Tenzir documentation, user guides, and workflows                                      |

## 🛠️ Development

To develop plugins locally, load them directly from source:

```bash
claude --plugin-dir plugins/*
```

This bypasses the plugin cache, so edits take effect on restart without
reinstallation.

## 📚 Documentation

See our [Claude marketplace
documentation](https://docs.tenzir.com/reference/claude-plugins) for
installation and usage.

## 📜 License

`claude-plugins` is available under the Apache License, Version 2.0. See
[`LICENSE`](LICENSE) for details.
