---
name: writing-documentation
description: Write documentation for Tenzir projects. Use when writing docs, updating guides, creating tutorials, adding integrations, or working with the tenzir/docs repository.
---

# Writing Documentation

Write documentation for Tenzir projects following the Diátaxis framework and
Tenzir conventions.

## Diátaxis Framework

Tenzir documentation uses the Diátaxis framework, which organizes content into
four quadrants based on user needs:

| Section          | Purpose                   | Reader question          |
| ---------------- | ------------------------- | ------------------------ |
| **Tutorials**    | Learning-oriented lessons | "I want to learn"        |
| **Guides**       | Goal-oriented how-tos     | "I want to accomplish X" |
| **Explanations** | Understanding-oriented    | "I want to understand"   |
| **Reference**    | Information-oriented      | "I need facts"           |

See [diataxis.md](./diataxis.md) for the decision tree and section guidelines.

## Integrations

Separately from Diátaxis, **Integrations** documents third-party products:
"How do I use X with Tenzir?"

Organized by vendor: `integrations/<vendor>/<product>.mdx`

## Directory Structure

Documentation lives in `.tenzir-docs/src/content/docs/`:

```
src/content/docs/
├── tutorials/      # Learning-oriented projects
├── guides/         # Task-oriented how-tos
├── explanations/   # Conceptual understanding
├── reference/      # Technical specifications (some auto-generated)
└── integrations/   # Third-party products by vendor
```

Integrations are organized by vendor: `integrations/<vendor>/<product>.mdx`

### Auto-Updated Files

Some files are automatically synced from upstream repositories. **Never edit**:

- `reference/functions/` - synced from tenzir/tenzir
- `reference/operators/` - synced from tenzir/tenzir
- `reference/functions.mdx` - auto-generated overview
- `reference/operators.mdx` - auto-generated overview
- `changelog/` directories - generated from changelog entries

To update these, make changes in the source repository (tenzir/tenzir or
tenzir/platform).

## File Format

- Use `.mdx` for new files
- Add frontmatter with `title` and `description`
- Use `tql` as the language identifier for TQL code blocks

See [format.md](./format.md) for frontmatter and code block details.

## Writing Style

Load the `writing:technical-writing` skill for detailed style guidance.

## Workflow

1. If `.tenzir-docs/` doesn't exist, call `docs:manager` with `initialize` mode.
2. Make changes in `.tenzir-docs/src/content/docs/`.
3. Use `docs:manager` with `preview` mode to verify changes.
4. Use `docs:manager` with `pr` mode to create a pull request.
