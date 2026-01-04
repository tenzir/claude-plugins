# Grouping and Ordering

Groups, z-ordering, and element organization.

## Groups

Elements share group membership via `groupIds`:

```json
{
  "id": "element-1",
  "groupIds": ["group-abc"]
}
{
  "id": "element-2",
  "groupIds": ["group-abc"]
}
```

### Nested Groups

Elements can belong to multiple nested groups (deepest to shallowest order):

```json
{
  "groupIds": ["inner-group", "outer-group"]
}
```

First entry is the most deeply nested group.

### Group Selection

When selecting a grouped element:

1. First click selects the entire group
2. Double-click to select individual elements within

## Z-Ordering

Element order is controlled by position in the `elements` array.

- Elements later in array appear on top
- First element is at the back

```json
{
  "elements": [
    { "id": "background" },
    { "id": "middle-layer" },
    { "id": "foreground" }
  ]
}
```

### Index Property

For multiplayer scenarios, use fractional index:

```json
{
  "index": "a1"
}
```

Follows rocicorp/fractional-indexing format.

## Frames

Use frames for logical grouping with names.

### Frame Element

```json
{
  "id": "my-frame",
  "type": "frame",
  "name": "Section A"
}
```

### Child Elements

Elements inside a frame reference it via `frameId`:

```json
{
  "id": "box-1",
  "type": "rectangle",
  "frameId": "my-frame"
}
```

## Visual Groups

For visual-only grouping without frame behavior:

```json
{
  "type": "rectangle",
  "strokeStyle": "dashed",
  "backgroundColor": "transparent",
  "strokeColor": "#868e96"
}
```

## Ordering Best Practices

1. Place background elements (frames, boundaries) first in array
2. Add main content elements in the middle
3. Place foreground elements (labels, annotations) last
4. Keep related elements adjacent in the array

## Lock State

Prevent accidental modification:

```json
{
  "locked": true
}
```

Locked elements:

- Cannot be moved or resized
- Can still be selected
- Must be unlocked to edit
