# Docs

Documentation workflows for Tenzir projects.

## ✨ Features

- 📝 **Writing Documentation Skill**: Guidance on the Diátaxis framework,
  section selection, and Tenzir docs conventions
- 🚀 **Write Command**: Interactive workflow for documenting changes
- 🔍 **Review Command**: Check completeness and style of documentation changes
- 🔀 **PR Command**: Create pull requests for documentation changes

## 📚 Documentation

Skills in this plugin follow the [Agent Skills](https://agentskills.io/) open
standard—a lightweight format for extending AI agent capabilities with
specialized knowledge and workflows.

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
- Integration with the `prose:technical-writing` skill for style guidance

### Write command

Interactive workflow via `/docs:write [topic]`:

1. Initializes docs repository if needed
2. Determines what to document (topic, changes, or last commit)
3. Selects the appropriate section using Diátaxis
4. Writes or updates documentation
5. Runs linting validation

### Review command

Review documentation changes via `/docs:review`:

1. Identifies changed files in `.docs/`
2. Starts the local preview server
3. Checks completeness (reference/guide alignment, cross-section consistency)
4. Reviews writing style against `prose:technical-writing` skill
5. Summarizes issues and offers to fix them

### PR command

Create a pull request via `/docs:pr`:

1. Checks for uncommitted changes
2. Runs linting and build checks
3. Creates a topic branch and commits
4. Opens a PR with `gh pr create`

## 🔧 Configuration

The plugin clones `github.com/tenzir/docs` to `.docs/` in your project root if
it doesn't exist yet.

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
