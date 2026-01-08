---
title: Enhanced diagramming documentation for technical limitations
type: change
authors:
  - mavam
  - claude
created: 2026-01-07T17:42:04.873284Z
---

The diagramming skill documentation now provides clearer guidance on several technical limitations and best practices.

Key improvements:

- **Polygon arrow bindings**: Documented that polygons cannot accept arrow bindings directly. When using labeled polygons, arrows must bind to the grouped text element instead.
- **Frame purpose**: Clarified that frames are slides or artboards for presentations, not containers for grouping elements within a single diagram.
- **Frame rendering**: Corrected documentation to explain that `frameRendering` is a runtime-only setting in `appState` that does not persist to files.
- **Text sizing**: Added standard font sizes (S/M/L/XL) with their pixel values and use cases for consistent styling.
- **Bound text positioning**: Simplified guidance to position bound text at the container center, letting Excalidraw handle automatic adjustment.

These changes prevent common errors when generating diagrams programmatically and align the documentation with Excalidraw's actual behavior.
