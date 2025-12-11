---
title: Refactor docs plugin workflow: remove agent, add dedicated commands
type: breaking
authors:
- mavam
- claude
components:
- docs
created: 2025-12-11T13:15:00.000000Z
---

Refactor documentation workflow to remove the redundant `docs:manager` agent.

Users should now use two dedicated commands instead:
- `/docs:write-docs` for creating and updating documentation (now with inlined initialization)
- `/docs:pr` for creating pull requests with documentation changes

The plugin now includes a shared `detect-docs-root.sh` script that intelligently detects whether you're in the docs repository or a project that uses an external docs checkout. The `/docs:write-docs` command now handles initialization automatically—no need to manually launch an agent first.

This simplifies the workflow and makes the documentation pipeline more intuitive and discoverable.
