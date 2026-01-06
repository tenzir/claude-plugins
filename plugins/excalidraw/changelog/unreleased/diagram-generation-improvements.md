---
title: Diagram generation improvements
type: change
authors:
  - mavam
  - claude
created: 2026-01-06T07:11:05.408999Z
---

Improved documentation to prevent common diagram generation errors:

- Arrow bindings: added guidance on ensuring both `startBinding`/`endBinding`
  are set and shapes list arrows in `boundElements`
- Polygon labels: documented that polygons require `groupIds` (not `containerId`)
  for labels to move together
- Text sizing: added formulas for estimating text dimensions
- Validation checklist: streamlined checks for bindings, polygons, and layout
