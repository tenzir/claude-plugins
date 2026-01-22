---
title: Unified dev plugin replaces docs and prose
type: breaking
authors:
  - mavam
  - claude
created: 2026-01-22T13:00:00.000000Z
---

The `docs` and `prose` plugins have been consolidated into a new `dev` plugin. Users must update their plugin configuration to replace `docs@tenzir` and `prose@tenzir` with `dev@tenzir`.

The new `dev` plugin combines documentation workflows with technical writing guidance into a single plugin for developer utilities. The skills are now `dev:docs-authoring` and `dev:technical-writing`, and the documentation agent is `@dev:docs-updater`.

**Migration guide:**

Update your `.claude/settings.json` to replace the old plugins with the new one:

```diff
 "plugins": [
-  "docs@tenzir",
-  "prose@tenzir",
+  "dev@tenzir"
 ]
```

**Removed commands:**

The `/docs:write`, `/docs:review`, and `/docs:pr` commands have been removed. Use `@dev:docs-updater` instead for autonomous documentation workflows.

**Skill mapping:**

| Old                       | New                     |
| ------------------------- | ----------------------- |
| `docs:authoring`          | `dev:docs-authoring`    |
| `prose:technical-writing` | `dev:technical-writing` |

**Agent mapping:**

| Old            | New                 |
| -------------- | ------------------- |
| `@docs:writer` | `@dev:docs-updater` |
