---
title: Correct text positioning formula for containers
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-05T21:17:59.17173Z
---

The text positioning formula now correctly accounts for alignment-based centering
within containers. The documentation also clarifies that the `label` property
is for Excalidraw's JavaScript API only—raw JSON files require separate
elements with `containerId` and `boundElements` references. Shape-specific
offsets for ellipses and diamonds are now documented.
