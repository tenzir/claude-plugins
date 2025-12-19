---
title: Use fully qualified skill names throughout plugins
type: breaking
authors:
  - mavam
  - claude
created: 2025-12-11T11:01:41.523774Z
---

All skill references now use fully qualified names (`plugin:skill-name` format) for clarity and consistency.

The following skills were renamed to follow the gerund naming convention and avoid redundancy with the plugin name prefix:

- `changelog-management` → `managing-entries`
- `writing-documentation` → `writing`

Affected references across plugins:

- `git:writing-commit-messages`
- `brand:styling-tenzir-ui`
- `changelog:managing-entries`
- `docs:writing`
- `meta:managing-plugins`
- `python:python-conventions`
- `writing:technical-writing`
