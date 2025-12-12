# TQL

Build TQL pipelines with the Tenzir MCP server.

## ✨ Features

This plugin integrates the [Tenzir MCP server](https://github.com/tenzir/mcp)
into Claude Code, enabling direct interaction with TQL pipelines.

- 🔗 **Pipeline Execution**: Run TQL pipelines and get results directly in Claude

## 📦 Installation

```
/plugin install tql@tenzir
```

## 🔧 Configuration

Requires [uv](https://docs.astral.sh/uv/) to be installed.

## ⚙️ How it works

- **When it triggers**: The MCP server starts when the plugin is loaded
- **What actions it performs**: Provides tools for building and executing TQL
  pipelines via the MCP server
- **Dependencies**: Requires `uv` / `uvx` to be installed
