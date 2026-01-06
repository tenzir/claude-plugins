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

## Font Selection Guide

Use these fonts by default:

| Context                    | Font         | ID  |
| -------------------------- | ------------ | --- |
| General text, labels       | Excalifont   | 5   |
| Code, monospace, technical | Comic Shanns | 8   |
| Clean, formal text         | Nunito       | 6   |

Always prefer Excalifont unless the content calls for monospace (code snippets,
technical identifiers) or a cleaner sans-serif look (formal documentation).

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

| Font ID          | Default lineHeight |
| ---------------- | ------------------ |
| 1 (Virgil)       | 1.25               |
| 2 (Helvetica)    | 1.15               |
| 3 (Cascadia)     | 1.2                |
| 5 (Excalifont)   | 1.25               |
| 6 (Nunito)       | 1.15               |
| 8 (Comic Shanns) | 1.2                |

Multiply by fontSize for pixel height: `lineHeightPx = lineHeight * fontSize`

## Estimating Text Size

To position text without browser font APIs, approximate dimensions:

```
height = fontSize * lineHeight * numberOfLines
width  ≈ characterCount * fontSize * 0.65
```

Use 0.65 for Excalifont (underestimating causes horizontal clipping). Narrow
characters (i, l, 1) are ~0.3, wide ones (M, W, m, w) are ~0.9.

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

**Important**: The `label` property is for Excalidraw's JavaScript API only. In raw JSON files, you must create two separate elements with `containerId` and `boundElements` referencing each other.

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

Bound text is centered with 5px padding. The available text area depends on
container shape:

| Shape     | Text area offset        | Available size          |
| --------- | ----------------------- | ----------------------- |
| Rectangle | 5px padding             | width - 10, height - 10 |
| Ellipse   | 0.146 × dimension + 5px | 0.707 × dimension - 10  |
| Diamond   | dimension / 4 + 5px     | dimension / 2 - 10      |

Center the text within that area:

```
text.x = container.x + offset + (availableWidth - textWidth) / 2
text.y = container.y + offset + (availableHeight - textHeight) / 2
```

## Text Containers

These elements can contain bound text:

- `rectangle`
- `diamond`
- `ellipse`
- `arrow`
