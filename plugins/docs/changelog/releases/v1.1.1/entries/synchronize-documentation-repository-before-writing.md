---
title: Synchronize documentation repository before writing
type: bugfix
authors:
  - mavam
  - claude
created: 2025-12-22T11:09:54.832292Z
---

The `/docs:write` command now synchronizes the `.docs/` clone before writing documentation. A new `scripts/synchronize-docs.sh` script handles cloning, fetching the latest changes from `main`, and installing dependencies.
