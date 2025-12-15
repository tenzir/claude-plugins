This is the initial major release of the brand plugin, providing comprehensive Tenzir design system specifications for frontend development. The plugin includes design tokens for colors, typography, spacing, and shadows, along with detailed component specifications for 10+ UI elements. It features CSS custom properties with the `--tnz-` namespace prefix, official SVG logo assets, and an expanded color palette supporting 9 colors across tags and badges.

## 🚀 Features

### Add brand plugin with Tenzir design system

The brand plugin provides Tenzir's design system specifications for frontend development.

The `styling-tenzir-ui` skill includes:

- **Design tokens**: Colors, typography, spacing, shadows, and border radius
- **Component specs**: Buttons, inputs, dropdowns, tags, badges, toasts, and 10+ more UI components
- **CSS custom properties**: Ready-to-use variables including `--primary-*` and `--secondary-*` aliases
- **Tailwind configuration**: Drop-in config snippets for immediate integration

When working on frontend code, Claude will reference the appropriate design tokens and component specifications to ensure consistent styling across Tenzir products.

_By @mavam and @claude._

### Add official SVG logo assets

Includes full logo and logomark variants, both in standard and white versions for dark backgrounds. Files are located in `assets/logos/`.

_By @mavam and @claude._

### Expand badge color palette to match tags

Badges now support the same 9 colors as tags: blue, lightblue, purple, pink, orange, yellow, red, green, and grey. Each color has solid and transparent border variants. The skill description now includes both "tags" and "badges" terms for discoverability.

_By @mavam and @claude._

### Standardize CSS custom properties with --tnz- prefix

The brand plugin now uses a consistent `--tnz-` namespace prefix for all CSS custom properties, preventing conflicts with other CSS frameworks and improving maintainability.

Changes include namespaced tokens (e.g., `--tnz-blue-500`, `--tnz-space-4`), Variable font support with static fallbacks, practical usage examples, and pixel value annotations.

_By @mavam and @claude._
