# Changelog Adder Action

Generate changelog entry suggestions for PRs using Claude Code with the
`dev:changelog-adder` agent. Suggestions are posted as PR comments for human
review—use [changelog-reactor](../changelog-reactor/README.md) to process
reactions.

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
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
```

## Inputs

| Input               | Required | Description                               |
| ------------------- | -------- | ----------------------------------------- |
| `anthropic_api_key` | Yes      | Anthropic API key or OAuth token          |
| `github_token`      | No       | GitHub token (defaults to `github.token`) |

## Outputs

| Output               | Description                                            |
| -------------------- | ------------------------------------------------------ |
| `suggestion_created` | `true` if a changelog suggestion was posted            |
| `skipped`            | `true` if skipped (entry already committed or pending) |

## Behavior

1. Checks if a changelog entry for this PR is already committed or pending
2. Runs Claude with the `dev:changelog-adder` agent to generate an entry
3. Posts a PR comment with:
   - The suggested changelog entry
   - Reaction buttons for accept (👍), reject (👎), regenerate (😕), and style changes
   - Embedded metadata for the reactor action
4. Cleans up the generated file (entry is recreated on accept)

If no user-facing changes are detected, the action exits silently.
Existing pending comments are not duplicated.

## Concurrency

The `concurrency` block in the workflow is required to prevent race conditions
when multiple pushes happen in quick succession. Without it, parallel runs
could create duplicate suggestions.
