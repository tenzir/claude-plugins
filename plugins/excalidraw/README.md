# Excalidraw

Generate valid `.excalidraw` JSON files that render correctly in excalidraw.com
or VS Code extensions.

## ✨ Features

- 📐 **All element types**: Shapes, text, arrows, lines, freedraw, images,
  frames, and custom polygons
- 🔗 **Proper bindings**: Text labels inside shapes, arrows connected to shapes
- 🎨 **Accurate properties**: Values and constants derived from Excalidraw
  source code

## 🚀 Usage

### `excalidraw:diagramming` skill

Activates when creating or editing `.excalidraw` files. Provides the file format
structure and progressively loads element and styling references as needed.

**When it activates:**

- Creating diagrams or `.excalidraw` files
- Asking about Excalidraw element structure or properties

**Example prompts:**

```
Create a diagram with three boxes connected by arrows
```

```
Draw a state machine with Start, Processing, and Done states
```

```
Make a simple org chart with a root node and three children
```
