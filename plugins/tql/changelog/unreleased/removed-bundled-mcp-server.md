---
title: Removed bundled MCP server
type: change
authors:
  - mavam
  - claude
created: 2025-12-28T16:42:20.606478Z
---

The bundled Tenzir MCP server has been removed to avoid conflicts with the
`docs:reader` subagent from the docs plugin. Documentation lookup now relies
entirely on the docs plugin dependency.
