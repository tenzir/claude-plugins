This release removes the bundled MCP server to streamline documentation lookup through the docs plugin dependency.

## 🔧 Changes

### Removed bundled MCP server

The bundled Tenzir MCP server has been removed to avoid conflicts with the `docs:reader` subagent from the docs plugin. Documentation lookup now relies entirely on the docs plugin dependency.

*By @mavam and @claude.*
