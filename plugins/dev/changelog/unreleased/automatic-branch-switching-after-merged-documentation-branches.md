---
title: Automatic branch switching after merged documentation branches
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-17T10:23:52.103415Z
---

The `.docs` directory now automatically switches to `main` when a topic branch has been merged, preventing stale documentation from being used during editing. Previously, the synchronization hook would only warn about merged branches but leave the repository on the stale branch, causing `docs:write` to work with outdated content.
