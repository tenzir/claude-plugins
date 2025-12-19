---
title: Unconditional documentation root at .docs
type: change
authors:
  - mavam
  - claude
created: 2025-12-19T06:00:36.691345Z
---

The docs plugin now unconditionally uses `.docs` as the documentation root instead of attempting to detect it. This simplifies the plugin's behavior and removes the dependency on the `detect-docs-root.sh` script, which has been deleted. Commands and skills have been updated to reference `.docs` directly throughout the documentation.
