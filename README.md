# 🔌 claude-plugins

`claude-plugins` is a collection of plugins for [Claude
Code](https://code.claude.com) that extend its capabilities with custom
commands, agents, hooks, skills, and MCP servers tailored for working with
[Tenzir](https://tenzir.com).

## Plugins

| Plugin      | Description                                                |
| ----------- | ---------------------------------------------------------- |
| `brand`     | Tenzir brand and style guidelines for frontend development |
| `changelog` | Manage changelogs and release notes with tenzir-changelog  |
| `cpp`       | C++ language support, tooling, and coding conventions      |
| `docs`      | Documentation workflows for Tenzir projects                |
| `formatter` | Auto-format files after Claude edits                       |
| `git`       | Git workflows for Tenzir repositories                      |
| `ocsf`      | Understand the OCSF schema structure                       |
| `prose`     | Style guidelines for technical prose                       |
| `python`    | Python coding conventions for Tenzir projects              |
| `tql`       | Build TQL pipelines with expert language guidance          |

## Installation

First, add this repository as a plugin marketplace:

```
/plugin marketplace add tenzir/claude-plugins
```

Then browse and install available plugins:

```
/plugin
```

Or install a specific plugin directly:

```
/plugin install <plugin-name>@tenzir
```

## 📚 Documentation

Consult the official [Claude Code plugins
documentation](https://code.claude.com/docs/en/plugins) for details on plugin
structure and configuration.

## 📜 License

`claude-plugins` is available under the Apache License, Version 2.0. See
[`LICENSE`](LICENSE) for details.
