# Colors

Tenzir's design system relies heavily on shades of grey as primary colors, with
pops of brighter colors used sparingly for emphasis or accent.

## Contents

- [Design Philosophy](#design-philosophy)
- [Neutrals](#neutrals)
- [Primary Colors](#primary-colors)
- [Secondary Colors](#secondary-colors)
- [Overlays](#overlays)
- [Semantic Colors Summary](#semantic-colors-summary)
- [Graph Colors](#graph-colors-ordered)
- [CSS Custom Properties](#css-custom-properties)

## Design Philosophy

Blue and green are chosen as primary colors for the website as they convey
important associations for the cyber security world:

- Trustworthiness and reliability
- Freshness and innovation
- Safety and protection
- Balance and stability

## Neutrals

The neutral palette forms the foundation of the UI.

| Token                     | HSL             | Hex         | Usage                                                          |
| ------------------------- | --------------- | ----------- | -------------------------------------------------------------- |
| `neutral-800`             | 222 25% 7%      | `#0E1017`   | Use as black, regular text, icons, editor default color        |
| `neutral-700`             | 222 25% 20%     | `#262E40`   | Inactive navigation, shortcut icons/text, secondary text links |
| `neutral-600`             | 222 20% 32%     | `#414B62`   | Secondary text, tertiary link color                            |
| `neutral-500`             | 222 15% 48%     | `#68738D`   | Tertiary text, input placeholder, state stopped icon           |
| `neutral-400`             | 222 15% 64%     | `#959DB1`   | Inspector (none), editor comment, label text (none)            |
| `neutral-300`             | 222 20% 84%     | `#CED3DE`   | Disabled primary button, inactive toggle, info icon            |
| `neutral-250`             | 222 20% 91%     | `#E3E6ED`   | Secondary button outline, divider tab bar, indentation line    |
| `neutral-200`             | 222 20% 95%     | `#F0F1F5`   | Divider, input border, segmented control bg, popup border      |
| `neutral-100`             | 222 20% 97%     | `#F7F8FA`   | App background (dashboard), hover, input field, label bg       |
| `neutral-50`              | 222 5% 99%      | `#FDFDFE`   | Use as white, icon on primary color                            |
| `neutral-600-transparent` | 222 20% 32% 12% | `#414B621F` | Outline tags, outline stop button                              |
| `neutral-400-transparent` | 222 20% 64% 12% | `#959DB11F` | Outline user images, outline library packages                  |

## Primary Colors

### Tenzir Blue

Used for highlights, semantic graphs, web, and brand elements.

| Token                    | HSL              | Hex         | Usage                                                   |
| ------------------------ | ---------------- | ----------- | ------------------------------------------------------- |
| `blue-600`               | 222 100% 44%     | `#0043E0`   | Hover primary button, selected text, state running icon |
| `blue-500` **(Primary)** | 222 100% 52%     | `#0A54FF`   | Primary button, active input, checkbox, active toggle   |
| `blue-400`               | 222 100% 64%     | `#477EFF`   | Text transparent badge                                  |
| `blue-300`               | 222 100% 81%     | `#ADC6FF`   | Active indentation line, activity bar egress, crosshair |
| `blue-200`               | 222 100% 94%     | `#E0EAFF`   | Hover selection, input glow, state running background   |
| `blue-100`               | 222 100% 97%     | `#F0F4FF`   | Selection                                               |
| `blue-50`                | 222 40% 98%      | `#F8F9FC`   | Active line in editor                                   |
| `blue-500-transparent`   | 222 100% 52% 12% | `#0A54FF1F` | Outline transparent badge                               |
| `blue-400-transparent`   | 222 100% 64% 12% | `#477EFF1F` | Hover shortcut button                                   |

### Tenzir Green

Used for success states, graphs, web, and brand elements.

| Token                       | HSL             | Hex         | Usage                      |
| --------------------------- | --------------- | ----------- | -------------------------- |
| `green-600`                 | 142 75% 40%     | `#1AB252`   | State completed icon       |
| `green-500` **(Secondary)** | 142 75% 52%     | `#29E06C`   | Brand color                |
| `green-400`                 | 142 75% 64%     | `#5EE891`   | —                          |
| `green-300`                 | 142 75% 84%     | `#B8F5CE`   | —                          |
| `green-200`                 | 142 75% 94%     | `#E4FBEC`   | State completed background |
| `green-100`                 | 142 75% 97%     | `#F2FDF6`   | —                          |
| `green-transparent`         | 142 75% 44% 12% | `#1CC45A1F` | —                          |

### Brand Gradient

```css
background: linear-gradient(to right, #0a54ff, #29e06c);
```

## Secondary Colors

Secondary colors highlight data types, pipeline states, or charts.

### Lightblue

Used for semantic highlighting and graphs.

| Token                   | HSL              | Hex         | Usage                                                    |
| ----------------------- | ---------------- | ----------- | -------------------------------------------------------- |
| `lightblue-600`         | 200 100% 44%     | `#0096E0`   | Inspector (int64, uint64, double), editor literal/string |
| `lightblue-500`         | 200 100% 52%     | `#0AADFF`   | Secondary graph color                                    |
| `lightblue-400`         | 200 100% 64%     | `#47C2FF`   | —                                                        |
| `lightblue-300`         | 200 100% 84%     | `#ADE4FF`   | —                                                        |
| `lightblue-200`         | 200 100% 94%     | `#E0F5FF`   | —                                                        |
| `lightblue-100`         | 200 100% 97%     | `#F0FAFF`   | —                                                        |
| `lightblue-transparent` | 200 100% 44% 12% | `#0096E01F` | —                                                        |

### Purple

Used for semantic highlighting and graphs.

| Token                | HSL              | Hex         | Usage                                                |
| -------------------- | ---------------- | ----------- | ---------------------------------------------------- |
| `purple-600`         | 288 100% 44%     | `#B400E0`   | Inspector (string, pattern, enum, blob), editor name |
| `purple-500`         | 288 100% 52%     | `#CF0AFF`   | Tertiary graph color                                 |
| `purple-400`         | 288 100% 64%     | `#DB47FF`   | —                                                    |
| `purple-300`         | 288 100% 84%     | `#EFADFF`   | —                                                    |
| `purple-200`         | 288 100% 94%     | `#F9E0FF`   | —                                                    |
| `purple-100`         | 288 100% 97%     | `#FCF0FF`   | —                                                    |
| `purple-transparent` | 288 100% 44% 12% | `#B400E01F` | —                                                    |

### Pink

Used for semantic highlighting and graphs.

| Token              | HSL              | Hex         | Usage                        |
| ------------------ | ---------------- | ----------- | ---------------------------- |
| `pink-600`         | 322 100% 44%     | `#E0008E`   | Inspector (bool), label text |
| `pink-500`         | 322 100% 52%     | `#FF0AA5`   | 4th graph color              |
| `pink-400`         | 322 100% 64%     | `#FF47BC`   | —                            |
| `pink-300`         | 322 100% 84%     | `#FFADE1`   | —                            |
| `pink-200`         | 322 100% 94%     | `#FFE0F4`   | —                            |
| `pink-100`         | 322 100% 97%     | `#FFF0F9`   | —                            |
| `pink-transparent` | 322 100% 44% 12% | `#E0008E1F` | —                            |

### Orange

Used for graphs.

| Token                | HSL             | Hex         | Usage           |
| -------------------- | --------------- | ----------- | --------------- |
| `orange-600`         | 20 100% 44%     | `#E04B00`   | —               |
| `orange-500`         | 20 100% 52%     | `#FF5C0A`   | 5th graph color |
| `orange-400`         | 20 100% 64%     | `#FF8547`   | —               |
| `orange-300`         | 20 100% 84%     | `#FFC9AD`   | —               |
| `orange-200`         | 20 100% 94%     | `#FFEBE0`   | —               |
| `orange-100`         | 20 100% 97%     | `#FFF5F0`   | —               |
| `orange-transparent` | 20 100% 44% 12% | `#E04B001F` | —               |

### Yellow

Used for warnings, semantic highlighting, and graphs.

| Token                | HSL             | Hex         | Usage                                                   |
| -------------------- | --------------- | ----------- | ------------------------------------------------------- |
| `yellow-600`         | 37 100% 44%     | `#D09611`   | Warning icon, inspector (ip, subnet), state paused icon |
| `yellow-500`         | 42 90% 52%      | `#EDAE1D`   | 6th graph color                                         |
| `yellow-400`         | 37 100% 64%     | `#F1C255`   | —                                                       |
| `yellow-300`         | 37 100% 84%     | `#F9E4B4`   | —                                                       |
| `yellow-200`         | 37 100% 94%     | `#FEF6E1`   | —                                                       |
| `yellow-100`         | 37 100% 97%     | `#FFF9F0`   | —                                                       |
| `yellow-transparent` | 37 100% 44% 12% | `#D096111F` | —                                                       |

### Red

Used for errors and semantic highlighting.

| Token                 | HSL              | Hex         | Usage                                        |
| --------------------- | ---------------- | ----------- | -------------------------------------------- |
| `red-600`             | 350 100% 44%     | `#E00025`   | Editor keyword/punctuation, state error icon |
| `red-500`             | 350 100% 52%     | `#FF0A33`   | Error, delete                                |
| `red-400`             | 350 100% 64%     | `#FF4766`   | Text transparent badge                       |
| `red-300`             | 350 100% 84%     | `#FFADBB`   | —                                            |
| `red-200`             | 350 100% 94%     | `#FFE0E5`   | —                                            |
| `red-100`             | 350 100% 97%     | `#FFF0F2`   | —                                            |
| `red-500-transparent` | 350 100% 52% 12% | `#FF0A331F` | Outline transparent badge                    |
| `red-400-transparent` | 350 100% 64% 12% | `#FF47661F` | Delete button shortcut info                  |

## Overlays

### Dim Overlays

Used for sidepanels, modals, and button states.

| Token                | Opacity | Usage                                   |
| -------------------- | ------- | --------------------------------------- |
| `neutral-800-dim-50` | 50%     | Full page dim                           |
| `neutral-800-dim-20` | 20%     | Pressed state for primary/error buttons |
| `neutral-800-dim-8`  | 8%      | —                                       |
| `neutral-800-dim-5`  | 5%      | Heat map box outline                    |
| `neutral-800-dim-4`  | 4%      | —                                       |

### Lighten Overlays

Used for shortcut info on buttons.

| Token                   | Opacity | Usage                           |
| ----------------------- | ------- | ------------------------------- |
| `neutral-50-lighten-20` | 20%     | Shortcut info on delete buttons |
| `neutral-50-lighten-8`  | 8%      | Shortcut info on buttons        |

## Semantic Colors Summary

| Purpose       | Icon/Text     | Background    |
| ------------- | ------------- | ------------- |
| **Primary**   | `blue-500`    | `blue-200`    |
| **Success**   | `green-600`   | `green-200`   |
| **Warning**   | `yellow-600`  | `yellow-200`  |
| **Error**     | `red-500`     | `red-200`     |
| **Running**   | `blue-600`    | `blue-200`    |
| **Stopped**   | `neutral-500` | `neutral-200` |
| **Paused**    | `yellow-600`  | `yellow-200`  |
| **Created**   | `neutral-800` | `neutral-100` |
| **Completed** | `green-600`   | `green-200`   |

## Graph Colors (Ordered)

Use these colors in sequence for multi-series charts:

1. `blue-500` (#0A54FF) - Primary
2. `lightblue-500` (#0AADFF) - Secondary
3. `purple-500` (#CF0AFF) - Tertiary
4. `pink-500` (#FF0AA5) - 4th
5. `orange-500` (#FF5C0A) - 5th
6. `yellow-500` (#EDAE1D) - 6th

## CSS Custom Properties

```css
:root {
  /* Neutrals */
  --neutral-800: #0e1017;
  --neutral-700: #262e40;
  --neutral-600: #414b62;
  --neutral-500: #68738d;
  --neutral-400: #959db1;
  --neutral-300: #ced3de;
  --neutral-250: #e3e6ed;
  --neutral-200: #f0f1f5;
  --neutral-100: #f7f8fa;
  --neutral-50: #fdfdfe;

  /* Blue */
  --blue-600: #0043e0;
  --blue-500: #0a54ff;
  --blue-400: #477eff;
  --blue-300: #adc6ff;
  --blue-200: #e0eaff;
  --blue-100: #f0f4ff;
  --blue-50: #f8f9fc;

  /* Green */
  --green-600: #1ab252;
  --green-500: #29e06c;
  --green-400: #5ee891;
  --green-300: #b8f5ce;
  --green-200: #e4fbec;
  --green-100: #f2fdf6;

  /* Primary aliases (maps to blue) */
  --primary-600: var(--blue-600);
  --primary-500: var(--blue-500);
  --primary-400: var(--blue-400);
  --primary-300: var(--blue-300);
  --primary-200: var(--blue-200);
  --primary-100: var(--blue-100);

  /* Secondary aliases (maps to green) */
  --secondary-600: var(--green-600);
  --secondary-500: var(--green-500);
  --secondary-400: var(--green-400);
  --secondary-300: var(--green-300);
  --secondary-200: var(--green-200);
  --secondary-100: var(--green-100);

  /* Lightblue */
  --lightblue-600: #0096e0;
  --lightblue-500: #0aadff;
  --lightblue-400: #47c2ff;
  --lightblue-300: #ade4ff;
  --lightblue-200: #e0f5ff;
  --lightblue-100: #f0faff;

  /* Purple */
  --purple-600: #b400e0;
  --purple-500: #cf0aff;
  --purple-400: #db47ff;
  --purple-300: #efadff;
  --purple-200: #f9e0ff;
  --purple-100: #fcf0ff;

  /* Pink */
  --pink-600: #e0008e;
  --pink-500: #ff0aa5;
  --pink-400: #ff47bc;
  --pink-300: #ffade1;
  --pink-200: #ffe0f4;
  --pink-100: #fff0f9;

  /* Orange */
  --orange-600: #e04b00;
  --orange-500: #ff5c0a;
  --orange-400: #ff8547;
  --orange-300: #ffc9ad;
  --orange-200: #ffebe0;
  --orange-100: #fff5f0;

  /* Yellow */
  --yellow-600: #d09611;
  --yellow-500: #edae1d;
  --yellow-400: #f1c255;
  --yellow-300: #f9e4b4;
  --yellow-200: #fef6e1;
  --yellow-100: #fff9f0;

  /* Red */
  --red-600: #e00025;
  --red-500: #ff0a33;
  --red-400: #ff4766;
  --red-300: #ffadbb;
  --red-200: #ffe0e5;
  --red-100: #fff0f2;

  /* Semantic aliases */
  --color-primary: var(--blue-500);
  --color-success: var(--green-600);
  --color-warning: var(--yellow-600);
  --color-error: var(--red-500);
  --color-text: var(--neutral-800);
  --color-text-secondary: var(--neutral-600);
  --color-text-tertiary: var(--neutral-500);
  --color-background: var(--neutral-100);
  --color-surface: var(--neutral-50);
  --color-border: var(--neutral-200);
}
```
