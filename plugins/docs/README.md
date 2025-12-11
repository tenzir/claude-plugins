# Docs

Documentation workflows for Tenzir projects.

## ✨ Features

- 📝 **Writing Documentation Skill**: Guidance on the Diátaxis framework,
  section selection, and Tenzir docs conventions
- 🚀 **Write Docs Command**: Interactive workflow for documenting changes
- 🔀 **PR Command**: Create pull requests for documentation changes

## 📦 Installation

```
/plugin install docs@tenzir
```

## ⚙️ How it works

### Writing documentation skill

Automatically loaded when working with documentation. Provides:

- The Diátaxis framework (Tutorials, Guides, Explanations, Reference) plus
  Integrations
- Decision tree for choosing the right documentation section
- File format conventions (`.mdx`)
- Frontmatter templates
- Integration with the `writing:technical-writing` skill for style guidance

### Write docs command

Interactive workflow via `/docs:write-docs [topic]`:

1. Initializes docs repository if needed
2. Determines what to document (topic, changes, or last commit)
3. Selects the appropriate section using Diátaxis
4. Writes or updates documentation
5. Runs linting validation

### PR command

Create a pull request via `/docs:pr`:

1. Checks for uncommitted changes
2. Runs linting and build checks
3. Creates a topic branch and commits
4. Opens a PR with `gh pr create`

## 🔧 Configuration

The plugin auto-detects whether you're working directly in the `tenzir/docs`
repository or in another project. For other projects, it clones
`github.com/tenzir/docs` to `.tenzir-docs/` in your project root.

## Documentation sections

The Diátaxis framework organizes documentation into four quadrants:

| Section      | Use for                                         |
| ------------ | ----------------------------------------------- |
| Tutorials    | Learning-oriented projects ("I want to learn")  |
| Guides       | Task-focused how-tos ("I want to accomplish X") |
| Explanations | Conceptual content ("I want to understand")     |
| Reference    | Technical specs ("I need facts")                |

Separately, Tenzir has an Integrations section for third-party products:

| Section      | Use for                                          |
| ------------ | ------------------------------------------------ |
| Integrations | Third-party products ("How do I use X + Tenzir") |
