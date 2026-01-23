# Dev

Developer utilities including documentation, changelogs, code review, plan
review, git workflows, auto-formatting, and releases. Provides documentation
workflows with the Diataxis framework, technical writing guidance based on
Google's style guide, changelog management with tenzir-ship, parallel code
review with specialized reviewers, automated plan review with external AI tools,
git commit/PR workflows, and automatic file formatting after edits.

## ✨ Features

- 📚 **Docs Authoring Skill**: Guidance on the Diataxis framework, section
  selection, and Tenzir docs conventions
- ✍️ **Technical Writing Skill**: Style guidelines for clear technical
  documentation following Google's developer documentation style guide
- 📝 **Changelog Adder Agent**: Creates changelog entries for PR changes,
  suitable for CI automation
- 🔍 **Code Review Command**: Spawns specialized reviewers in parallel to
  analyze changes with confidence-scored findings
- 🔧 **Fix Command**: Addresses review findings one-by-one, spawning an Opus
  agent per fix with automatic GitHub thread resolution
- 🚀 **Release Command**: Guides through releasing a project with tenzir-ship
- 🔄 **Finalize Command**: Adds changelog entry, commits, and pushes changes
- 🔬 **Plan Reviewer Agent**: Reviews implementation plans using external AI
  models (Codex, Gemini, Opus) with structured evaluation methodology
- 📦 **Committer Agent**: Stages and commits changes with cohesion analysis and
  automatic splitting of unrelated changes
- 🔀 **PR Maker Agent**: Creates GitHub pull requests with proper branching
  and commit workflows
- 🤖 **Fixer Agent**: Opus-powered agent that fixes a single finding, commits,
  and resolves GitHub threads
- 🔧 **Auto-Formatting Hook**: Automatically formats files after every Write or
  Edit operation using language-specific formatters

## 🚀 Usage

### Updating documentation

For hands-off documentation, delegate to the docs updater subagent:

```
Document the latest changes @dev:docs-updater
```

The subagent writes docs, reviews them, runs linting, and creates a PR against
`tenzir/docs`--all without further input.

### Creating changelog entries

Spawn the changelog adder agent to create a changelog entry for your changes:

```
Create a changelog entry @dev:changelog-adder
```

The agent analyzes your changes and creates an appropriate changelog entry using
tenzir-ship.

### Code review

Run parallel code review on your changes:

```
/dev:review
```

This spawns specialized reviewers (security, architecture, tests, UX,
readability, docs, performance) that analyze your changes in parallel and report
findings with confidence scores.

After reviewing, fix findings with `/fix` (iterative) or plan mode (bulk):

```
/dev:review
    │
    ├─► Detect scope (staged/unstaged/branch)
    ├─► Check for PR, gather project context
    │
    ├─► Spawn reviewers in parallel:
    │   ├─► @dev:reviewers:security    → .reviews/<session>/security.md
    │   ├─► @dev:reviewers:arch        → .reviews/<session>/arch.md
    │   ├─► @dev:reviewers:tests       → .reviews/<session>/tests.md
    │   ├─► @dev:reviewers:ux          → .reviews/<session>/ux.md
    │   ├─► @dev:reviewers:readability → .reviews/<session>/readability.md
    │   ├─► @dev:reviewers:docs        → .reviews/<session>/docs.md
    │   ├─► @dev:reviewers:performance → .reviews/<session>/performance.md
    │   └─► @dev:reviewers:github      → .reviews/<session>/github.md (if PR)
    │
    ├─► Synthesize: deduplicate, correlate, prioritize
    ├─► Display: 🔴 P1 · 🛡️ SEC-1 · SQL injection (95%) · src/db.ts:45
    │
    └─► Options: /fix or plan mode
            │
            ├───────────────────────────────┐
            ▼                               ▼
        /dev:fix                       Plan mode
            │                               │
            ├─► For each finding:           ├─► Plan all fixes
            │   ├─► Show + ask user         ├─► Implement
            │   └─► @dev:fixer (Opus):      ├─► Commit + push
            │       ├─► Make fix            └─► Resolve threads
            │       ├─► Commit + push
            │       └─► Resolve thread
            │
            └─► Summary
```

### Fixing findings

After `/review`, use `/fix` to address findings one-by-one:

```
/dev:fix
```

Each fix spawns an `@dev:fixer` agent (Opus) with fresh context. For GitHub
findings (GIT-\*), it automatically replies with the commit SHA and resolves
the thread.

### Releasing

Guide through a release:

```
/dev:release [patch|minor|major]
```

### Finalizing changes

Add changelog, commit, and push in one command:

```
/dev:finalize
```

### Committing changes

For automated workflows, use the committer agent:

```
@dev:committer
```

The agent gathers context, runs static checks, analyzes change cohesion (auto-
splitting orthogonal changes into separate commits), and commits with proper
messages.

### Creating pull requests

Use the PR maker agent:

```
@dev:pr-maker
```

The agent verifies changes, creates a topic branch if needed, commits changes
using `@dev:committer`, pushes, and creates the PR on GitHub.

## 🔧 Configuration

### Documentation repository

The plugin clones `github.com/tenzir/docs` to `.docs/` in your project root if
it doesn't exist yet.

A sync hook keeps `.docs/` up-to-date when editing documentation files. It
fetches updates at most once per day and blocks on merge conflicts so Claude can
help resolve them.

### Plan review

Use the plan reviewer agent to validate implementation plans with external models:

```
@dev:reviewers:plan
```

The agent supports model shortcuts:

| Shortcut | Model                     |
| -------- | ------------------------- |
| `codex`  | OpenAI GPT-5.2 Codex      |
| `gemini` | Google Gemini Flash       |
| `opus`   | Anthropic Claude Opus 4.5 |

Reviews evaluate plans across five dimensions (completeness, correctness,
feasibility, risk, clarity) and return a verdict:

- **BLOCK**: Critical (P1) findings - fundamental flaws
- **REVISE**: Major (P2) findings - significant issues
- **APPROVE**: No P1 or P2 findings

### Auto-formatting

The plugin auto-formats files after every Write or Edit operation. Install the
formatters you need:

| File Type                                    | Tool         | Config Required |
| -------------------------------------------- | ------------ | --------------- |
| `.cpp`, `.hpp`, `.*pp.in`                    | clang-format | No              |
| `.cmake`, `CMakeLists.txt`                   | cmake-format | No              |
| `.sh`, `.bash`                               | shfmt        | No              |
| `.md`, `.mdx`                                | markdownlint | No              |
| `.md`, `.mdx`                                | prettier     | No              |
| `.json`                                      | biome        | Yes             |
| `.json`                                      | prettier     | Yes             |
| `.yaml`, `.yml`                              | yamllint     | No              |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | biome        | Yes             |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | eslint       | Yes             |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | prettier     | Yes             |

For JS/TS and JSON files, the hook searches for config files (`biome.json`,
`eslint.config.*`, `.prettierrc*`) from the edited file's directory upward. If
no config is found, formatting is skipped for these file types.

## Documentation sections

The Diataxis framework organizes documentation into four quadrants:

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
