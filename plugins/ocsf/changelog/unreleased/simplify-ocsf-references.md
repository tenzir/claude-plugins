---
title: Simplify OCSF plugin by removing local reference generation
type: breaking
authors:
  - mavam
  - claude
created: 2026-01-16T00:00:00.000000Z
---

Remove local reference generation in favor of fetching OCSF documentation
directly from Tenzir docs at runtime.

This change removes:

- The `scripts/` directory with `generate-references.py` and `sync-docs.py`
- The `ocsf:understanding-ocsf` skill and all local reference files
- The `Skill` tool from the guide agent (no longer needed)

The `ocsf:guide` agent now fetches documentation directly from
`docs.tenzir.com/reference/ocsf/` at startup, which ensures access to the
latest schema documentation without requiring local generation.

The agent model has been changed from Sonnet to Haiku for faster responses.
