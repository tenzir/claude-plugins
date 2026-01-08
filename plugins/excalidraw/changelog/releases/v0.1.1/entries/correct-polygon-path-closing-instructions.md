---
title: Correct polygon path closing instructions
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-05T20:58:59.111956Z
---

The polygon reference documentation incorrectly stated that paths automatically
close. Excalidraw's interactive UI does auto-close, but programmatic JSON
creation requires explicitly including the first point again at the end. All
polygon examples now include the closing point, and the point counts in the
reference table reflect this requirement.
