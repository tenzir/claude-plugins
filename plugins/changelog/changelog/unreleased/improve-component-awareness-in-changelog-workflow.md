---
title: Improve component awareness in changelog workflow
type: change
authors:
  - mavam
  - claude
created: 2025-12-15T09:13:03.090542Z
---

The `/changelog:add` workflow now checks `changelog/config.yaml` for available
components before creating entries. When a component clearly fits the change,
it should be selected. Cross-cutting changes (e.g., CI work) can still omit
components.
