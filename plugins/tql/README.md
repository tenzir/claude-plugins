# TQL

Build TQL pipelines with the Tenzir MCP server.

## ✨ Features

This plugin integrates the [Tenzir MCP server](https://github.com/tenzir/mcp)
into Claude Code, enabling direct interaction with TQL pipelines.

- 🔗 **Pipeline Execution**: Run TQL pipelines and get results directly in Claude
- 📚 **Documentation Lookup**: Query live Tenzir documentation for operators,
  functions, and syntax

## 🚀 Usage

### `tql:writing-programs` Skill

Invoke this skill when writing or debugging TQL programs. It automatically loads TQL language fundamentals and activates the `docs:reader` subagent for real-time documentation lookups.

## 🔗 Dependencies

For documentation lookup, install the docs plugin:

```
/plugin install docs@tenzir
```

## 📦 Installation

```
/plugin install tql@tenzir
```

Requires [uv](https://docs.astral.sh/uv/) to be installed on your system.
