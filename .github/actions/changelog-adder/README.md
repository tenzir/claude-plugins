# Changelog Adder Action

Automatically add changelog entries to PRs using Claude Code with the
`changelog:adder` agent.

## Usage

```yaml
name: Add Changelog Entry

on:
  pull_request:
    types: [opened, synchronize]

concurrency:
  group: changelog-${{ github.event.pull_request.number }}
  cancel-in-progress: true

jobs:
  changelog:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pull-requests: write
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          ref: ${{ github.head_ref }}

      - name: Add changelog entry
        uses: tenzir/claude-plugins/.github/actions/changelog-adder@main
        with:
          anthropic_oauth_token: ${{ secrets.ANTHROPIC_CLAUDE_CODE_OAUTH_TOKEN }}
```

## Inputs

| Input                   | Required | Description                               |
| ----------------------- | -------- | ----------------------------------------- |
| `anthropic_oauth_token` | Yes      | Claude Code OAuth token                   |
| `github_token`          | No       | GitHub token (defaults to `github.token`) |

## Outputs

| Output          | Description                              |
| --------------- | ---------------------------------------- |
| `entry_created` | `true` if a new entry was created        |
| `entry_file`    | Path to the created entry file           |
| `skipped`       | `true` if skipped (entry already exists) |

## Behavior

1. Checks if a changelog entry for this PR already exists (idempotent)
2. Runs Claude with the `changelog:adder` agent
3. Agent analyzes PR and runs `/changelog:add` if user-facing changes exist
4. Agent commits the entry to the PR branch
5. Posts or updates a PR comment with:
   - Status badge (`✓ added` or `✓ exists`)
   - Color-coded type badge (feature/bugfix/breaking/change)
   - Entry metadata (PR number, authors, date)
   - Entry content

If no user-facing changes are detected, the action exits silently.
Existing comments are updated in place rather than creating duplicates.

## Concurrency

The `concurrency` block in the workflow is required to prevent race conditions
when multiple pushes happen in quick succession. Without it, parallel runs
could create duplicate entries.
