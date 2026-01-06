---
title: Content-based sync for OCSF documentation
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-06T11:41:12.091638Z
---

The OCSF docs sync workflow now compares actual file content instead of tracking
upstream commit SHAs. This prevents unnecessary syncs when the ocsf-docs
repository has infrastructure-only changes that don't affect articles or FAQs.
