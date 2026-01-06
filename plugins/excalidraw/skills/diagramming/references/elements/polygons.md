# Polygon Elements

Custom shapes from line elements with closed paths.

## Basic Polygon

Set `polygon: true` on a line element:

```json
{
  "type": "line",
  "points": [
    [0, 0],
    [100, 0],
    [100, 100],
    [0, 100],
    [0, 0]
  ],
  "polygon": true
}
```

Include the first point again at the end to close the path.

## Custom Shapes

### Triangle

```json
{
  "type": "line",
  "points": [
    [50, 0],
    [100, 86],
    [0, 86],
    [50, 0]
  ],
  "polygon": true,
  "backgroundColor": "#a5d8ff",
  "fillStyle": "solid"
}
```

### Pentagon

```json
{
  "type": "line",
  "points": [
    [50, 0],
    [97, 34],
    [79, 90],
    [21, 90],
    [3, 34],
    [50, 0]
  ],
  "polygon": true
}
```

### Hexagon

```json
{
  "type": "line",
  "points": [
    [25, 0],
    [75, 0],
    [100, 43],
    [75, 86],
    [25, 86],
    [0, 43],
    [25, 0]
  ],
  "polygon": true
}
```

### Star (5-point)

Alternating outer and inner vertices:

```json
{
  "type": "line",
  "points": [
    [50, 0],
    [61, 35],
    [98, 35],
    [68, 57],
    [79, 91],
    [50, 70],
    [21, 91],
    [32, 57],
    [2, 35],
    [39, 35],
    [50, 0]
  ],
  "polygon": true
}
```

### Arrow Shape

```json
{
  "type": "line",
  "points": [
    [0, 30],
    [60, 30],
    [60, 0],
    [100, 50],
    [60, 100],
    [60, 70],
    [0, 70],
    [0, 30]
  ],
  "polygon": true
}
```

## Calculating Vertices

### Regular Polygons

For n-sided regular polygon with radius r:

```
angle = 2π / n
x[i] = r * cos(i * angle - π/2)
y[i] = r * sin(i * angle - π/2)
```

Subtract π/2 to start from top center.

### Stars

For n-pointed star with outer radius R and inner radius r:

```
angle = π / n
x[2i] = R * cos(2i * angle - π/2)     // outer points
y[2i] = R * sin(2i * angle - π/2)
x[2i+1] = r * cos((2i+1) * angle - π/2)  // inner points
y[2i+1] = r * sin((2i+1) * angle - π/2)
```

Inner radius typically 0.38 \* R for classic 5-point star.

## Styling

All fill and stroke styles work with polygons:

```json
{
  "fillStyle": "solid",
  "backgroundColor": "#a5d8ff",
  "strokeColor": "#1971c2",
  "strokeWidth": 2,
  "strokeStyle": "solid",
  "roughness": 1
}
```

## Composition Patterns

### Layered Shapes

Stack shapes with decreasing size for depth effect.

### Badges and Labels

Hexagon or custom shape behind text:

```json
[
  { "type": "line", "points": [...], "polygon": true, "backgroundColor": "#e03131" },
  { "type": "text", "text": "NEW", "x": 25, "y": 35 }
]
```

### Complex Outlines

For shapes with holes, layer a smaller shape on top with background color.

## Validation

### Minimum Points

Polygons require at least 4 points (3 vertices + closing point).

### Point Format

Each point is `[x, y]` relative to element position.

### Self-Intersection

Avoid self-intersecting paths for predictable fill behavior.

## Common Shapes Reference

| Shape     | Points | Formula                       |
| --------- | ------ | ----------------------------- |
| Triangle  | 4      | 60° angles                    |
| Square    | 5      | 90° angles                    |
| Pentagon  | 6      | 72° angles                    |
| Hexagon   | 7      | 60° angles                    |
| Octagon   | 9      | 45° angles                    |
| 5-pt Star | 11     | Alternating R/r vertices      |
| 6-pt Star | 13     | Alternating R/r vertices      |
| Arrow     | 8      | Chevron with rectangular tail |
