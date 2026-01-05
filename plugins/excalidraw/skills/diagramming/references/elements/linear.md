# Linear Elements

Lines and arrows with bindings and routing.

## Arrow Element

```json
{
  "type": "arrow",
  "x": 200,
  "y": 150,
  "width": 100,
  "height": 50,
  "points": [
    [0, 0],
    [100, 50]
  ],
  "startBinding": null,
  "endBinding": null,
  "startArrowhead": null,
  "endArrowhead": "triangle",
  "elbowed": false,
  "roughness": 0,
  "roundness": null
}
```

## Line Element

```json
{
  "type": "line",
  "points": [
    [0, 0],
    [100, 0],
    [100, 50]
  ],
  "polygon": false
}
```

Set `polygon: true` for closed shapes (auto-closes from last to first point).

## Points Array

Points are relative to element `x,y` (local coordinates):

```json
{
  "x": 100,
  "y": 200,
  "points": [
    [0, 0],
    [50, 30],
    [100, 0]
  ]
}
```

Absolute positions: (100, 200), (150, 230), (200, 200)

## Arrowhead Types

12 types for `startArrowhead` and `endArrowhead` (plus `null` for none):

| Type                   | Description      | Use Case                   |
| ---------------------- | ---------------- | -------------------------- |
| `arrow`                | Standard arrow   | General connections        |
| `bar`                  | Flat bar         | Termination point          |
| `dot`                  | Dot (legacy)     | -                          |
| `circle`               | Filled circle    | Entity markers             |
| `circle_outline`       | Hollow circle    | Optional entities          |
| `triangle`             | Filled triangle  | Strong direction (default) |
| `triangle_outline`     | Hollow triangle  | Weak direction             |
| `diamond`              | Filled diamond   | Composition (UML)          |
| `diamond_outline`      | Hollow diamond   | Aggregation (UML)          |
| `crowfoot_one`         | One (ER)         | Exactly one                |
| `crowfoot_many`        | Many (ER)        | Zero or more               |
| `crowfoot_one_or_many` | One or many (ER) | One or more                |

### Bidirectional Arrows

```json
{
  "startArrowhead": "arrow",
  "endArrowhead": "arrow"
}
```

## Arrow Modes

| Mode  | Properties                                         |
| ----- | -------------------------------------------------- |
| Sharp | `roughness: 0`, `roundness: null`                  |
| Round | `roughness: 1`, `roundness: { "type": 2 }`         |
| Elbow | `roughness: 0`, `roundness: null`, `elbowed: true` |

## Elbow Arrows

For 90-degree routing, set all three:

```json
{
  "type": "arrow",
  "roughness": 0,
  "roundness": null,
  "elbowed": true
}
```

### Elbow-specific Properties

| Property         | Description                           |
| ---------------- | ------------------------------------- |
| `fixedSegments`  | Manually locked segments              |
| `startIsSpecial` | Hide first segment during transitions |
| `endIsSpecial`   | Hide last segment during transitions  |

## Arrow Binding

Arrows can bind to shapes for automatic positioning.

### Binding Structure

```json
{
  "startBinding": {
    "elementId": "shape-id",
    "fixedPoint": [0.5, 1],
    "mode": "orbit"
  },
  "endBinding": {
    "elementId": "other-shape-id",
    "fixedPoint": [0.5, 0],
    "mode": "orbit"
  }
}
```

### fixedPoint Values

Position as ratio (0.0 to 1.0) of shape dimensions:

| Position      | fixedPoint   |
| ------------- | ------------ |
| Top center    | `[0.5, 0]`   |
| Bottom center | `[0.5, 1]`   |
| Left center   | `[0, 0.5]`   |
| Right center  | `[1, 0.5]`   |
| Top left      | `[0, 0]`     |
| Top right     | `[1, 0]`     |
| Bottom left   | `[0, 1]`     |
| Bottom right  | `[1, 1]`     |
| Center        | `[0.5, 0.5]` |

### Binding Modes

| Mode     | Description                              |
| -------- | ---------------------------------------- |
| `orbit`  | Arrow stays outside shape (wraps around) |
| `inside` | Arrow can go inside to exact point       |
| `skip`   | No binding                               |

### Bindable Elements

Arrows can bind to:

- rectangle, diamond, ellipse
- text (uncontained), image
- iframe, embeddable
- frame, magicframe

## Constants

| Constant               | Value | Description            |
| ---------------------- | ----- | ---------------------- |
| MINIMUM_ARROW_SIZE     | 20px  | Minimum arrow length   |
| BASE_BINDING_GAP       | 10px  | Gap for regular arrows |
| BASE_BINDING_GAP_ELBOW | 5px   | Gap for elbow arrows   |

Add half the shape's strokeWidth to binding gap.

## Shape boundElements

When binding, update the shape's `boundElements`:

```json
{
  "id": "my-shape",
  "type": "rectangle",
  "boundElements": [
    { "type": "text", "id": "my-shape-text" },
    { "type": "arrow", "id": "arrow-to-shape" }
  ]
}
```

## Edge Calculation

Without bindings, calculate arrow position from shape edges:

| Edge   | X             | Y              |
| ------ | ------------- | -------------- |
| Top    | `x + width/2` | `y`            |
| Bottom | `x + width/2` | `y + height`   |
| Left   | `x`           | `y + height/2` |
| Right  | `x + width`   | `y + height/2` |

## Width and Height

Arrow `width` and `height` = bounding box of points:

```
points = [[0, 0], [-440, 0], [-440, 70]]
width = abs(-440) = 440
height = abs(70) = 70
```

## Routing Patterns

| Pattern            | Points                           | Use Case        |
| ------------------ | -------------------------------- | --------------- |
| Straight down      | `[[0,0], [0,h]]`                 | Vertical flow   |
| Straight right     | `[[0,0], [w,0]]`                 | Horizontal flow |
| L-shape right-down | `[[0,0], [w,0], [w,h]]`          | Corner routing  |
| L-shape down-right | `[[0,0], [0,h], [w,h]]`          | Corner routing  |
| U-turn             | `[[0,0], [c,0], [c,-h], [x,-h]]` | Callback arrows |

## Staggering Multiple Arrows

Spread arrows evenly across an edge:

```
For N arrows from bottom edge:
  position[i] = 0.2 + (0.6 * i / (N - 1))

Examples:
  2 arrows: 20%, 80%
  3 arrows: 20%, 50%, 80%
  5 arrows: 20%, 35%, 50%, 65%, 80%
```
