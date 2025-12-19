---
title: Release workflow simplified with clearer module release handling
type: change
authors:
  - mavam
  - claude
created: 2025-12-19T08:28:16.972633Z
---

Release workflow simplified and clarified. The release command now consolidates module release logic into a single "Detect Release Context" section, distinguishing between standard and module releases. Steps 7-8 were streamlined to reduce redundancy. The releaser agent was refactored to focus only on orthogonal concerns (validation, autonomous decisions, error handling), removing duplicated workflow steps that belong to the slash command.
