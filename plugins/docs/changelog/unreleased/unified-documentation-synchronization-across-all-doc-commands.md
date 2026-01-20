---
title: Unified documentation synchronization across all doc commands
type: change
authors:
  - mavam
  - claude
created: 2026-01-20T16:40:08.806526Z
---

The documentation synchronization hook now runs across all three documentation commands (`/docs:write`, `/docs:review`, and `/docs:pr`) with an improved two-phase initialization approach. The first file operation automatically clones the docs repository if missing, while subsequent operations perform staleness checks. This change ensures consistent `.docs/` synchronization across all documentation workflows without requiring manual git commands.

Additionally, command documentation now uses declarative language instead of explicit bash code blocks, making the instructions clearer and more maintainable.
