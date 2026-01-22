---
title: Command-scoped documentation synchronization hook
type: change
authors:
  - mavam
  - claude
created: 2026-01-17T10:28:48.008383Z
---

The documentation synchronization hook now runs only during the `/docs:write` command instead of on every file operation. The hook configuration moved from `hooks/hooks.json` to the command's frontmatter, making the behavior more explicit and reducing unnecessary synchronization checks.
