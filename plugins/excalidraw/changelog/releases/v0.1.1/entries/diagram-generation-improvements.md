---
title: Diagram generation improvements
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-06T07:11:05.408999Z
---

Improved documentation to prevent common diagram generation errors:

- Text width: increased estimation factor from 0.6 to 0.65 to prevent clipping
- Hexagons: added formula for consistent 60° angles with variable width
- Spacing: added minimum spacing rules (40px siblings, 60px rows, 40px frame padding)
- Arrow bindings: guidance on `startBinding`/`endBinding` and `boundElements`
- Polygon labels: use `groupIds` instead of `containerId`
- Validation: added label text verification to checklist
