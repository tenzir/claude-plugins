---
name: styling-tenzir-ui
description: Provides Tenzir design system tokens and component specifications. Use when building UI components, styling with CSS/Tailwind, choosing colors, typography, spacing, or implementing buttons, inputs, tags, toasts, and other Tenzir UI elements.
---

# Styling Tenzir UI

This skill provides Tenzir's brand and style guidelines for frontend development.

## Contents

- [Design System Overview](#design-system-overview)
- [Quick Reference](#quick-reference)
- [When to Load References](#when-to-load-references)

## Design System Overview

Tenzir's design system provides consistent styling across all Tenzir products.

When implementing frontend components, always reference the appropriate section:

| Aspect         | Reference                                      | Description                                    |
| -------------- | ---------------------------------------------- | ---------------------------------------------- |
| Typography     | [typography.md](./typography.md)               | Font families, sizes, weights, line heights    |
| Colors         | [colors.md](./colors.md)                       | Brand colors, semantic colors, neutrals        |
| Spacing        | [spacing.md](./spacing.md)                     | Padding and margin scale                       |
| Shadows        | [shadows.md](./shadows.md)                     | Elevation and shadow styles                    |
| Border Radius  | [border-radius.md](./border-radius.md)         | Corner radius tokens (always 5px)              |
| Buttons        | [buttons.md](./buttons.md)                     | All button styles (standard, delete, floating) |
| Dropdown       | [dropdown.md](./dropdown.md)                   | Dropdown trigger with chevron                  |
| Hyperlinks     | [hyperlinks.md](./hyperlinks.md)               | Link styling with underline                    |
| Segmented Ctrl | [segmented-control.md](./segmented-control.md) | Toggle between mutually exclusive options      |
| Input Field    | [input-field.md](./input-field.md)             | Text input with title and states               |
| Search Input   | [search-input.md](./search-input.md)           | Search field with icon and clear               |
| Checkbox       | [checkbox.md](./checkbox.md)                   | Square multi-select control                    |
| Radio Button   | [radio-button.md](./radio-button.md)           | Circular single-select control                 |
| Toggle Switch  | [toggle-switch.md](./toggle-switch.md)         | Binary on/off switch                           |
| Tag            | [tag.md](./tag.md)                             | Colored labels for categorization              |
| Badge          | [badge.md](./badge.md)                         | Small uppercase status indicators              |
| Tab Bar        | [tab-bar.md](./tab-bar.md)                     | Horizontal navigation tabs                     |
| Toast          | [toast.md](./toast.md)                         | Transient notification messages                |

## Quick Reference

### Fonts

- **Inter** - Corporate font for UI text
- **JetBrains Mono** - Monospace font for code

### Usage Guidelines

1. **Always use design tokens** - Never hardcode pixel values; use the token names (e.g., `text-sm`, `text-base`)
2. **Respect the type scale** - Use the defined sizes; don't create custom sizes
3. **Match weight to purpose** - Use semi-bold for headings, medium for emphasis, regular for body text
4. **Apply letter-spacing** - Larger text sizes (2xl+) require negative letter-spacing

### Spacing

- **Scale:** 0, 0.5, 1, 2, 3, 4, 5, 6, 7, 8, 10, 16, 20
- **Base unit:** 4px (1 = 0.25rem = 4px)
- **Common:** p-2 (8px) for inputs, p-4 (16px) for containers, gap-4 (16px) for sections

### Colors

- **Primary:** Blue (`#0A54FF`) and Green (`#29E06C`)
- **Neutrals:** 11-shade grey scale from `neutral-800` (black) to `neutral-50` (white)
- **Semantic:** Success (green), Warning (yellow), Error (red)
- **Graph colors:** Blue, Lightblue, Purple, Pink, Orange, Yellow (in order)

### Shadows

- **shadow-l** - Sidepanels and modals (highest elevation)
- **shadow-m** - Popups
- **shadow-s** - Tooltips and toasts
- **shadow-xs** - Subtle elevation (lowest)

### Buttons

- **Primary** - Solid blue (`blue-500`), main actions
- **Secondary** - Outlined (`neutral-250` border), alternative actions
- **Tertiary** - Text-only, low-emphasis actions
- **Sizes:** XS (24px), S (28px), M (32px), L (36px)

### Inputs

- **Input Field** - M (32px), L (36px) heights; neutral-100 background
- **Search** - 32px height with search icon and clear button
- **Checkbox** - 16px square, 5px radius
- **Radio Button** - 16px circle
- **Toggle Switch** - 32x20px with sliding knob
- **Focus ring** - 3px primary-200 for inputs, 2px for controls

### Tags & Badges

- **Tag** - 24px height, 10 colors, add/remove variants
- **Badge** - 16px height, 8px uppercase text, blue/red colors

### Navigation

- **Tab Bar** - 48px height, 2px active indicator, notification counter support

### Feedback

- **Toast** - 48px min-height, shadow-s, optional icon/subtitle/button/progress bar

## When to Load References

Load the specific reference file when you need detailed specifications:

- Working on typography? Read [typography.md](./typography.md)
- Implementing colors? Read [colors.md](./colors.md)
- Adding shadows/elevation? Read [shadows.md](./shadows.md)
- Building buttons? Read [buttons.md](./buttons.md)
- Adding spacing? Read [spacing.md](./spacing.md)
