---
title: Unified developer utilities with integrated changelog and code review
type: feature
authors:
  - mavam
  - claude
created: 2026-01-22T16:37:46.852256Z
---

The ship plugin has been consolidated into the dev plugin, creating a unified developer utilities plugin. The dev plugin now provides changelog management, code review, and release workflows alongside its existing documentation capabilities.

The `@dev:changelog-adder` agent replaces `ship:adder` for creating changelog entries. Seven specialized code reviewers (`arch`, `docs`, `performance`, `readability`, `security`, `tests`, `ux`) are now available under `@dev:reviewers:*`. The `/dev:review` command spawns these reviewers in parallel to analyze code changes with confidence-scored findings.

Release workflows moved to `/dev:release` and `/dev:finalize` commands. The changelog management features use tenzir-ship under the hood and support both standalone projects and module-based projects.

All external references in GitHub Actions workflows, the Tenzir plugin skills, and documentation have been updated to reference the new dev plugin agents and commands.
