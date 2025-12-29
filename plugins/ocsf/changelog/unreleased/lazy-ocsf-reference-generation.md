---
title: Lazy OCSF reference generation
type: feature
authors:
  - mavam
  - claude
created: 2025-12-28T20:21:41.007626Z
---

OCSF reference documentation is now generated lazily on first use. Instead of
blocking session start with a hook, the skill instructs Claude to run the
generator script when references are missing. The script now uses the OCSF
server's REST API (`/api/version`, `/export/schema`) instead of HTML scraping,
making generation faster and more reliable (~4 seconds for latest version).
