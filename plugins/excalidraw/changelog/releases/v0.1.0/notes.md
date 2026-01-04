Initial release of the Excalidraw plugin for generating valid diagram files. The plugin supports flowcharts, ER diagrams, sequence diagrams, and architecture diagrams with proper element bindings and Excalidraw-native styling.

## 🚀 Features

### Initial release

The Excalidraw plugin generates valid `.excalidraw` JSON files for flowcharts, ER diagrams, sequence diagrams, and architecture diagrams. The `excalidraw:diagramming` skill produces properly structured diagrams with all element types (shapes, text, arrows, lines, images, frames, and custom polygons), correct bindings between elements, and consistent styling using Excalidraw's color palettes and fill patterns.

All element properties and constants are derived directly from the Excalidraw source code, ensuring generated files render correctly in excalidraw.com and VS Code extensions. The skill uses progressive reference loading with organized documentation for element types and styling properties.

_By @mavam and @claude._
