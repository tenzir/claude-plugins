# 🔌 claude-plugins

`claude-plugins` is a collection of plugins for [Claude
Code](https://code.claude.com) that extend its capabilities with custom
commands, agents, hooks, skills, and MCP servers tailored for working with
[Tenzir](https://tenzir.com).

## Plugins

| Plugin       | Description                                                |
| ------------ | ---------------------------------------------------------- |
| `brand`      | Tenzir brand and style guidelines for frontend development |
| `cpp`        | C++ language support, tooling, and coding conventions      |
| `docs`       | Documentation workflows for Tenzir projects                |
| `excalidraw` | Create Excalidraw diagrams with proper JSON structure      |
| `formatter`  | Auto-format files after Claude edits                       |
| `git`        | Git workflows for Tenzir repositories                      |
| `prose`      | Style guidelines for technical prose                       |
| `python`     | Python coding conventions for Tenzir projects              |
| `ship`       | Release engineering with tenzir-ship                       |
| `tenzir`     | Build TQL pipelines and OCSF mappings with expert guidance |

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
