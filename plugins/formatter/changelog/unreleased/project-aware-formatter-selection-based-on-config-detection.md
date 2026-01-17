---
title: Project-aware formatter selection based on config detection
type: feature
authors:
  - mavam
  - claude
pr: 9
created: 2026-01-17T09:52:09.348996Z
---

The formatter hook now detects which formatter your project uses by searching for config files from the edited file's directory up to the filesystem root. This prevents applying wrong formatting rules to projects that use different tools.

For JavaScript, TypeScript, JSON, and Markdown files, the hook checks for Biome, ESLint, or Prettier configuration files (such as `biome.json`, `.eslintrc*`, or `.prettierrc*`) before running formatters. If no config is found, the hook skips formatting for that file type, ensuring your project's formatting conventions are respected.

The hook also adds Prettier as a fallback option for JavaScript and TypeScript files, providing broader compatibility with different project setups.
