# Badge

Small uppercase label for status indicators and feature flags.

## Props

| Prop           | Values          |
| -------------- | --------------- |
| `color`        | `blue`, `red`   |
| `transparency` | `true`, `false` |

## Size Specifications

| Property      | Value |
| ------------- | ----- |
| Height        | 16px  |
| Padding X     | 4px   |
| Padding Y     | 1px   |
| Border radius | 3px   |
| Border        | 1px   |

## Typography

| Property       | Value           |
| -------------- | --------------- |
| Font family    | Inter           |
| Font size      | 8px             |
| Font weight    | Semi Bold (600) |
| Line height    | 14px            |
| Text transform | uppercase       |
| Letter spacing | 0.4px           |

## Color Specifications

| Variant            | Border                  | Text                    |
| ------------------ | ----------------------- | ----------------------- |
| Blue (solid)       | `primary-300` (#adc6ff) | `primary-500` (#0a54ff) |
| Blue (transparent) | rgba(0, 67, 224, 0.12)  | `primary-400` (#477eff) |
| Red (transparent)  | rgba(224, 0, 37, 0.12)  | `red-400` (#ff4766)     |

## CSS Implementation

```css
/* Badge Base */
.badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 1px 4px;
  border-radius: 3px;
  border: 1px solid;
  font-family: "Inter", sans-serif;
  font-size: 8px;
  font-weight: 600;
  line-height: 14px;
  text-transform: uppercase;
  letter-spacing: 0.4px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Blue badge (solid border) */
.badge--blue {
  border-color: var(--primary-300);
  color: var(--primary-500);
}

/* Blue badge (transparent border) */
.badge--blue-transparent {
  border-color: rgba(0, 67, 224, 0.12);
  color: var(--primary-400);
}

/* Red badge (transparent border) */
.badge--red-transparent {
  border-color: rgba(224, 0, 37, 0.12);
  color: var(--red-400);
}
```

## CSS Custom Properties

```css
:root {
  /* Badge sizing */
  --badge-height: 16px;
  --badge-padding-x: 4px;
  --badge-padding-y: 1px;
  --badge-radius: 3px;

  /* Badge typography */
  --badge-font-size: 8px;
  --badge-font-weight: 600;
  --badge-line-height: 14px;
  --badge-letter-spacing: 0.4px;
}
```

## Usage Guidelines

1. **Common use cases**:
   - **NEW** - Highlight new features
   - **BETA** - Mark experimental features
   - **OR** - Boolean operator indicator
   - **OFF** - Disabled state indicator

2. **Transparency selection**:
   - **Solid border** - More prominent, use for important badges
   - **Transparent border** - Subtle, use inline with other elements

3. **Color selection**:
   - **Blue** - Neutral/informational badges
   - **Red** - Warning or disabled states

4. **Placement**:
   - Typically next to feature names or in headers
   - Keep badges short (1-4 characters ideal)

5. **Accessibility**:
   - Badges are decorative; ensure meaning is also conveyed in context
   - Don't rely solely on color to convey meaning
