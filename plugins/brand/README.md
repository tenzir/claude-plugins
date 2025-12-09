# Brand

Tenzir brand and style guidelines for frontend development.

## ✨ Features

- 🎨 **Design Tokens** - Colors, typography, spacing, and shadows as CSS custom
  properties and Tailwind config
- 🧩 **Component Specs** - Buttons, inputs, tags, toasts, and 15+ UI components
  with all states documented
- 🎯 **Tailwind Ready** - Configuration snippets for immediate integration
- 🖼️ **Logo Assets** - Official SVG logos and logomarks in standard and white
  variants

## 📦 Installation

```
/plugin install brand@tenzir
```

## ⚙️ How it works

This plugin provides a `styling-tenzir-ui` skill that gives Claude access to
Tenzir's design system specifications.

When working on frontend code, Claude will:

1. Reference the appropriate design tokens (colors, typography, spacing)
2. Use correct font families (Inter for UI, JetBrains Mono for code)
3. Apply proper semantic colors for states (success, warning, error)
4. Follow the established type scale and color palette

The skill uses a modular structure with a top-level overview and detailed
reference files that are loaded on demand to minimize context usage.

## Logo Assets

Official Tenzir logos are available in `assets/logos/`:

| File                 | Description                    |
| -------------------- | ------------------------------ |
| `logo.svg`           | Full Tenzir logo               |
| `logo-white.svg`     | Full logo for dark backgrounds |
| `logomark.svg`       | Logomark only (the "T" symbol) |
| `logomark-white.svg` | Logomark for dark backgrounds  |

## Legal

Tenzir and the Tenzir logo are trademarks of Tenzir GmbH. These brand
guidelines are provided for developing Tenzir products and integrations.
Using these guidelines to create products or materials that suggest official
Tenzir affiliation requires written permission.
