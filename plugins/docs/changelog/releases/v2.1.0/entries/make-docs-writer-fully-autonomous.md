---
title: Fully autonomous documentation writer
type: feature
authors:
  - mavam
  - claude
created: 2025-12-28T16:27:00Z
---

Make `docs:writer` subagent fully autonomous. The subagent now handles the
entire documentation workflow including PR creation by running all git commands
from within `.docs/`. Remove `/docs:pr` command as it was a leaky abstraction
that didn't properly handle the nested repo context.
