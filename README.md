# 🔌 claude-plugins

`claude-plugins` is a collection of plugins for [Claude
Code](https://code.claude.com) that extend its capabilities with custom
commands, agents, hooks, skills, and MCP servers tailored for working with
[Tenzir](https://tenzir.com).

## 📦 Installation

First, add this repository as a plugin marketplace:

```
/plugin marketplace add tenzir/claude-plugins
```

> [!TIP]
> If you encounter SSH authentication issues, use the full HTTPS URL instead:
>
> ```
> /plugin marketplace add https://github.com/tenzir/claude-plugins.git
> ```

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

> [!NOTE]
> Some plugins touch C++ tooling (e.g., clangd, IWYU). These tools are useful,
> but their configurations should be tailored to the specific repository and
> kept with the project that uses them.

## 📜 License

`claude-plugins` is available under the Apache License, Version 2.0. See
[`LICENSE`](LICENSE) for details.
