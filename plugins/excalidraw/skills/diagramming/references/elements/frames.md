# Frame Elements

Grouping containers with names for organizing diagrams.

## Frame Element

```json
{
  "type": "frame",
  "name": "Section A",
  "x": 100,
  "y": 100,
  "width": 400,
  "height": 300
}
```

## Properties

| Property | Type   | Description            |
| -------- | ------ | ---------------------- |
| `name`   | string | Display name (or null) |

Frames use ADAPTIVE_RADIUS (type 3) for rounded corners like rectangles.

## Magic Frame

AI-generated content frame:

```json
{
  "type": "magicframe",
  "name": "Generated UI"
}
```

### Magic Frame Custom Data

```json
{
  "customData": {
    "generationData": {
      "status": "done",
      "html": "<generated content>"
    }
  }
}
```

Status values: `pending`, `done`, `error`

## Child Elements

Elements inside a frame reference it via `frameId`:

```json
{
  "id": "box-1",
  "type": "rectangle",
  "frameId": "my-frame"
}
```

## Frame Rendering

Frame behavior options (in appState):

```json
{
  "frameRendering": {
    "enabled": true,
    "name": true,
    "outline": true,
    "clip": true
  }
}
```

| Option    | Description                  |
| --------- | ---------------------------- |
| `enabled` | Show frames                  |
| `name`    | Display frame names          |
| `outline` | Show frame border            |
| `clip`    | Clip content to frame bounds |

## Arrow Binding

Frames are bindable targets for arrows:

```json
{
  "type": "frame",
  "boundElements": [{ "type": "arrow", "id": "arrow-to-frame" }]
}
```
