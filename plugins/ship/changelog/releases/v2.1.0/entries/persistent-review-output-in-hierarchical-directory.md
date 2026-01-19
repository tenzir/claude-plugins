---
title: Persistent review output in hierarchical directory
type: change
authors:
  - mavam
  - claude
created: 2026-01-19T08:09:09.027692Z
---

Code reviews are now saved persistently in a hierarchical `.reviews/` directory instead of being deleted after display.

The `ship:review` command creates a timestamped directory structure:

```
.reviews/
  YYYY-MM-DD/
    <session-id>/
      ux.md
      arch.md
      docs.md
      security.md
      tests.md
      consistency.md
```

This lets you inspect complete review findings after the review completes. The command displays a summary of high-confidence findings (80+) but saves all findings with their confidence scores to the files for later reference.
