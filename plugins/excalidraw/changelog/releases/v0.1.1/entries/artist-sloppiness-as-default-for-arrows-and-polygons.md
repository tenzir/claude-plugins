---
title: Artist sloppiness as default for arrows and polygons
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-06T06:28:02.947284Z
---

Arrow and polygon examples now use `roughness: 1` (Artist) instead of `roughness: 0` (Architect), matching Excalidraw's default hand-drawn style. This ensures generated diagrams have the characteristic sketchy appearance rather than clean, precise lines.
