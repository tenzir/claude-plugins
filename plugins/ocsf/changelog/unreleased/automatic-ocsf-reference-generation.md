---
title: Automatic OCSF reference generation
type: feature
authors:
  - mavam
  - claude
created: 2025-12-28T20:21:41.007626Z
---

OCSF reference documentation is now generated automatically on session start.
The `SessionStart` hook checks for existing references and generates them from
schema.ocsf.io if missing, eliminating manual setup steps.
