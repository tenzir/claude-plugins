---
title: Add `/changelog:release` command
type: feature
authors:
  - mavam
  - claude
components:
  - changelog
created: 2025-12-05T17:08:31.296559Z
---

The changelog plugin now includes a `/changelog:release` command that guides
through the release workflow for any project using `tenzir-changelog`. The
command auto-detects the project type (e.g., Python via `pyproject.toml`) and
applies language-specific steps like quality gates and version bumping.
