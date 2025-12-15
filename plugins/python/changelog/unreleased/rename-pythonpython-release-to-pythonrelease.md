---
title: Replace `/python:release` with `/changelog:release`
type: breaking
authors:
  - mavam
  - claude
created: 2025-12-05T07:23:51.267263Z
---

The `/python:release` command has been removed. Use `/changelog:release`
instead, which auto-detects Python projects and applies the appropriate quality
gates and version bumping.
