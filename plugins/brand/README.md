# Brand

Tenzir brand and style guidelines for frontend development. Includes design
tokens, component specifications, and official logo assets to ensure consistent
UI styling across Tenzir products.

## ✨ Features

- 🎨 **Design Tokens** - Colors, typography, spacing, and shadows as CSS custom
  properties and Tailwind config
- 🧩 **Component Specs** - 17 UI components (buttons, inputs, tags, toasts, and
  more) with all states documented
- ⚡ **Tailwind Ready** - Configuration snippets for immediate integration
- 🏷️ **Logo Assets** - Official SVG logos and logomarks in standard and white
  variants

## 🚀 Usage

The `brand:styling-tenzir-ui` skill activates automatically when you work on
Tenzir frontend code. It provides design tokens, component specs, and CSS
snippets for consistent UI styling.

### Example: Building a Button

Ask Claude to create a submit button:

```
Create a primary submit button for the pipeline editor
```

Claude references the button specs and produces CSS using correct tokens:

```css
.btn-submit {
  background: var(--tnz-blue-500);
  color: var(--tnz-neutral-50);
  height: 32px;
  padding: 6px 12px;
  border-radius: var(--tnz-radius);
  font-weight: 600;
}

.btn-submit:hover {
  background: var(--tnz-blue-600);
}

.btn-submit:focus-visible {
  outline: 3px solid var(--tnz-blue-300);
}
```

### Example: Implementing Tags

When building a filter UI with colored tags:

```
Add status tags for pipeline states: running, paused, stopped
```

Claude applies the tag color palette with proper semantic mapping:

- Running: blue (`--tnz-blue-200` background, `--tnz-blue-600` text)
- Paused: yellow (`--tnz-yellow-200` background, `--tnz-yellow-600` text)
- Stopped: grey (`--tnz-neutral-200` background, `--tnz-neutral-600` text)

### Example: Toast Notifications

```
Show an error toast when pipeline deployment fails
```

Claude generates the toast with error styling, icon color (`--tnz-red-600`),
and progress bar border (`--tnz-red-400`).

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
