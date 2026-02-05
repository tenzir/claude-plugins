---
title: Generalized workflow orchestration system
type: change
authors:
  - mavam
  - claude
pr: 15
created: 2026-02-05T11:25:44.509304Z
---

Consolidate workflow skills into a generalized orchestration system.

The Tenzir plugin now uses a two-tier workflow system: the `tenzir:orchestrating-workflows` skill guides you through multi-step workflows by breaking them into trackable tasks, while the `tenzir:workflow-executor` agent handles execution of individual steps. This replaces the previous granular skills for managing packages and mapping to OCSF, which are now read from the `tenzir:docs` skill and orchestrated dynamically. The new system makes it easier to add new workflows without creating additional skills.
