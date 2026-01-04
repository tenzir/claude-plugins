# Text Elements

Standalone text and labels bound to containers.

## Text Element

```json
{
  "type": "text",
  "text": "Label Text",
  "fontSize": 20,
  "fontFamily": 5,
  "textAlign": "center",
  "verticalAlign": "middle",
  "containerId": null,
  "originalText": "Label Text",
  "autoResize": true,
  "lineHeight": 1.25
}
```

## Font Families

| ID  | Name            | Style      |
| --- | --------------- | ---------- |
| 1   | Virgil          | Hand-drawn |
| 2   | Helvetica       | Sans-serif |
| 3   | Cascadia        | Monospace  |
| 5   | Excalifont      | Hand-drawn |
| 6   | Nunito          | Sans-serif |
| 7   | Lilita One      | Display    |
| 8   | Comic Shanns    | Monospace  |
| 9   | Liberation Sans | Sans-serif |
| 10  | Assistant       | Sans-serif |

Note: ID 4 is reserved/unused. Default: `DEFAULT_FONT_FAMILY = 5` (Excalifont).

## Font Sizes

Built-in size constants:

| Name | Value |
| ---- | ----- |
| sm   | 16    |
| md   | 20    |
| lg   | 28    |
| xl   | 36    |

Defaults: `DEFAULT_FONT_SIZE = 20`, `MIN_FONT_SIZE = 1`

## Text Alignment

| Property        | Values              | Default |
| --------------- | ------------------- | ------- |
| `textAlign`     | left, center, right | left    |
| `verticalAlign` | top, middle, bottom | top     |

## Line Height

| Font ID        | Default lineHeight |
| -------------- | ------------------ |
| 1 (Virgil)     | 1.25               |
| 2 (Helvetica)  | 1.15               |
| 3 (Cascadia)   | 1.2                |
| 5 (Excalifont) | 1.25               |

Multiply by fontSize for pixel height: `lineHeightPx = lineHeight * fontSize`

## Multi-line Text

Use `\n` for line breaks:

```json
{
  "text": "Line One\nLine Two",
  "originalText": "Line One\nLine Two"
}
```

## Container Binding

Text can be bound inside shapes (rectangles, diamonds, ellipses, arrows).

### Shape with bound text

```json
{
  "id": "box-1",
  "type": "rectangle",
  "boundElements": [{ "type": "text", "id": "box-1-text" }]
}
```

### Text referencing container

```json
{
  "id": "box-1-text",
  "type": "text",
  "containerId": "box-1",
  "textAlign": "center",
  "verticalAlign": "middle"
}
```

### Container Padding

`BOUND_TEXT_PADDING = 5px` - padding around text inside containers.

## autoResize Behavior

| Value | Behavior                    |
| ----- | --------------------------- |
| true  | Width expands to fit text   |
| false | Text wraps to element width |

## Text Positioning in Containers

When text is bound:

```
text.x = container.x + 5
text.y = container.y + (container.height - text.height) / 2
text.width = container.width - 10
```

## Text Containers

These elements can contain bound text:

- `rectangle`
- `diamond`
- `ellipse`
- `arrow`
