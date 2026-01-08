This release improves the accuracy and reliability of Excalidraw diagram generation through better documentation and corrected defaults. It fixes several bugs related to polygon path closing, text positioning formulas, and roughness settings, while also enhancing documentation to clarify technical limitations around arrow bindings, frames, and text sizing.

## 🔧 Changes

### Bidirectional arrow binding documentation

The arrow binding documentation now includes a complete example showing how to connect shapes with arrows that move together when dragged. The documentation clarifies that bindings are bidirectional—both the arrow's `startBinding`/`endBinding` and the shape's `boundElements` must reference each other. New sections explain arrow positioning rules (first point must be `[0, 0]`) and the formula for calculating edge attachment points from `fixedPoint` ratios.

*By @mavam and @claude.*

### Enhanced diagramming documentation for technical limitations

The diagramming skill documentation now provides clearer guidance on several technical limitations and best practices.

Key improvements:

- **Polygon arrow bindings**: Documented that polygons cannot accept arrow bindings directly. When using labeled polygons, arrows must bind to the grouped text element instead.
- **Frame purpose**: Clarified that frames are slides or artboards for presentations, not containers for grouping elements within a single diagram.
- **Frame rendering**: Corrected documentation to explain that `frameRendering` is a runtime-only setting in `appState` that does not persist to files.
- **Text sizing**: Added standard font sizes (S/M/L/XL) with their pixel values and use cases for consistent styling.
- **Bound text positioning**: Simplified guidance to position bound text at the container center, letting Excalidraw handle automatic adjustment.

These changes prevent common errors when generating diagrams programmatically and align the documentation with Excalidraw's actual behavior.

*By @mavam and @claude.*

### Font selection defaults for diagram text

The text reference now includes a font selection guide with recommended defaults: Excalifont for general text, Comic Shanns for code and technical content, and Nunito for clean formal text. The line height table also includes values for these fonts.

*By @mavam and @claude.*

### Triangle arrowhead as default

The `triangle` arrowhead provides stronger visual direction than the standard `arrow` type, making diagrams clearer.

*By @mavam and @claude.*

## 🐞 Bug fixes

### Artist sloppiness as default for arrows and polygons

Arrow and polygon examples now use `roughness: 1` (Artist) instead of `roughness: 0` (Architect), matching Excalidraw's default hand-drawn style. This ensures generated diagrams have the characteristic sketchy appearance rather than clean, precise lines.

*By @mavam and @claude.*

### Correct polygon path closing instructions

The polygon reference documentation incorrectly stated that paths automatically close. Excalidraw's interactive UI does auto-close, but programmatic JSON creation requires explicitly including the first point again at the end. All polygon examples now include the closing point, and the point counts in the reference table reflect this requirement.

*By @mavam and @claude.*

### Correct text positioning formula for containers

The text positioning formula now correctly accounts for alignment-based centering within containers. The documentation also clarifies that the `label` property is for Excalidraw's JavaScript API only—raw JSON files require separate elements with `containerId` and `boundElements` references. Shape-specific offsets for ellipses and diamonds are now documented.

*By @mavam and @claude.*

### Diagram generation improvements

Improved documentation to prevent common diagram generation errors:

- Text width: increased estimation factor from 0.6 to 0.65 to prevent clipping
- Hexagons: added formula for consistent 60° angles with variable width
- Spacing: added minimum spacing rules (40px siblings, 60px rows, 40px frame padding)
- Arrow bindings: guidance on `startBinding`/`endBinding` and `boundElements`
- Polygon labels: use `groupIds` instead of `containerId`
- Validation: added label text verification to checklist

*By @mavam and @claude.*
