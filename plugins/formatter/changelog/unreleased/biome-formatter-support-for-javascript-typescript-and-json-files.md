---
title: Biome formatter support for JavaScript, TypeScript, and JSON files
type: feature
authors:
  - mavam
  - claude
created: 2026-01-16T18:50:12.507936Z
---

The formatter plugin now supports Biome as the preferred formatter for JavaScript, TypeScript, and JSON files, with automatic fallback to existing tools when Biome isn't installed.

Biome is a fast, modern formatter and linter that combines the functionality of tools like ESLint and Prettier into a single executable. When you edit JavaScript, TypeScript, or JSON files, the plugin now checks for `biome` first and uses it if available. If Biome isn't installed, the hook falls back to the previous behavior: `eslint` for JS/TS files and `prettier` for JSON files.

This change requires no configuration—install Biome with `npm install -g @biomejs/biome` to enable it, or continue using your existing formatters.
