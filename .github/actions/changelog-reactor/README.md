# Changelog Reactor Action

Process reactions on changelog suggestions posted by
[changelog-adder](../changelog-adder/README.md). Users react to suggestion
comments with emojis to accept, reject, regenerate, or adjust the style.

## Usage

This action is triggered by issue comment reactions. The calling workflow must
map reaction emojis to action names:

```yaml
name: Process Changelog Reaction

on:
  issue_comment:
    types: [created]

jobs:
  react:
    if: github.event.issue.pull_request && contains(github.event.comment.body, '<!-- changelog-adder-bot -->')
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pull-requests: write
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          ref: refs/pull/${{ github.event.issue.number }}/head

      - name: Process reaction
        uses: tenzir/claude-plugins/.github/actions/changelog-reactor@main
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          github_token: ${{ secrets.GITHUB_TOKEN }}
          pr_number: ${{ github.event.issue.number }}
          comment_id: ${{ github.event.comment.id }}
          action: accept # mapped from reaction emoji
          reactor: ${{ github.actor }}
```

## Inputs

| Input               | Required | Description                           |
| ------------------- | -------- | ------------------------------------- |
| `anthropic_api_key` | Yes      | Anthropic API key or OAuth token      |
| `github_token`      | Yes      | GitHub token for PR operations        |
| `pr_number`         | Yes      | PR number                             |
| `comment_id`        | Yes      | Comment ID containing the suggestion  |
| `action`            | Yes      | Action to perform (see Actions table) |
| `reactor`           | Yes      | Username of the user who reacted      |

## Actions

| Action           | Emoji | Description                                   |
| ---------------- | ----- | --------------------------------------------- |
| `accept`         | 👍    | Commit the suggested entry to the PR branch   |
| `reject`         | 👎    | Mark as rejected, no entry will be added      |
| `regenerate`     | 😕    | Generate a different entry with new wording   |
| `more-technical` | 🚀    | Rewrite with more technical depth             |
| `less-technical` | 👀    | Simplify for non-developer audiences          |
| `more-cynical`   | 😄    | Add dry wit and seasoned engineer perspective |

## Behavior

1. Extracts the entry content and file path from the comment metadata
2. Performs the requested action:
   - **accept**: Creates the entry file and commits it to the PR branch
   - **reject**: Updates the comment to show rejected status
   - **regenerate/style changes**: Runs Claude to generate a new entry, then updates the comment
3. Updates the comment to reflect the new status

The comment is updated in place to show the current state (pending, accepted,
rejected) and who performed the action.
