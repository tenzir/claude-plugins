---
title: Fail-fast validation and clarified module detection in release command
type: change
authors:
  - mavam
  - claude
created: 2026-01-08T21:42:08.448223Z
---

The release command now performs upfront validation, aborting immediately if no unreleased entries exist in the target changelog directory. This prevents unnecessary processing and provides faster feedback.

The module detection process is now explicitly two-stage: first checking for a `modules` field in the repository's changelog config, then verifying unreleased entries in the appropriate directory (module-specific or top-level).

The documentation structure has been reorganized with dedicated sections for release context, agent setup, and module-specific workflows, making it easier to understand the release flow.
