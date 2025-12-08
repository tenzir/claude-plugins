# Border Radius

Standard corner radius token for the design system.

## Default Value

| Token    | Value |
| -------- | ----- |
| `radius` | 5px   |

## CSS Custom Properties

```css
:root {
  --radius: 5px;
  --border-radius: 5px;
}
```

## Usage

All rectangular components use the same 5px border radius:

- Buttons
- Input fields
- Dropdowns
- Tags
- Toasts
- Cards
- Modals
- Tooltips

## Exceptions

| Component                | Radius  | Reason                            |
| ------------------------ | ------- | --------------------------------- |
| Badge                    | 3px     | Smaller component, tighter radius |
| Shortcut badge           | 3px     | Inline with badge styling         |
| Segmented control button | 3px-4px | Fits within 5px container         |
| Radio button             | 50%     | Circular by design                |
| Toggle switch            | 35px    | Pill shape by design              |

## CSS Implementation

```css
.component {
  border-radius: var(--radius);
}
```

## Usage Guidelines

1. **Consistency** - Use 5px for standard rectangular components
2. **Exceptions exist** - See the exceptions table above for components that use different values
3. **Use the token** - Reference `var(--radius)` instead of hardcoding `5px`
