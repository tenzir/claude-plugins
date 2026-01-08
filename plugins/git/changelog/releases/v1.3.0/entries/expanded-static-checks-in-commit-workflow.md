---
title: Expanded static checks in commit workflow
type: change
authors:
  - mavam
  - claude
created: 2026-01-08T20:34:58.387974Z
---

The commit workflow now runs static checks before analyzing whether to split staged changes into multiple commits. The step explicitly includes linters, type checkers, and formatters, checking `pyproject.toml`, `package.json`, or `Makefile` for configured tools and skipping if none are found.
