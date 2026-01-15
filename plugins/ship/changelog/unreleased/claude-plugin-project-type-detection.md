---
title: Claude plugin project type detection
type: feature
authors:
  - mavam
  - claude
created: 2026-01-15T07:46:01.522467Z
---

The `/ship:release` command now automatically detects Claude Code plugins and
knows to update the version in `.claude-plugin/plugin.json`. This eliminates
manual version file discovery during plugin releases.
