---
title: Automatic clone of documentation repository
type: bugfix
authors:
  - mavam
  - claude
created: 2025-12-29T10:56:34.918915Z
---

The synchronization script now automatically clones the docs repository when `.docs/` doesn't exist, instead of silently exiting. The hook also triggers on Read operations to ensure the repository is available earlier in the workflow.

Additionally, the duplicate `hooks/sync-docs.sh` script was removed in favor of the more sophisticated `scripts/synchronize-docs.sh`.
