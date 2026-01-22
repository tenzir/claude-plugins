---
title: Consolidated docs and prose into dev plugin
type: breaking
authors:
  - mavam
  - claude
created: 2026-01-22T13:00:00.000000Z
---

The `docs` plugin has been renamed to `dev` and now includes the `technical-writing` skill from the former `prose` plugin. This consolidation creates a unified plugin for developer utilities.

**Components:**

- Skills: `dev:docs-authoring`, `dev:technical-writing`
- Agent: `@dev:docs-updater`

Commands have been removed in favor of the `@dev:docs-updater` subagent.
