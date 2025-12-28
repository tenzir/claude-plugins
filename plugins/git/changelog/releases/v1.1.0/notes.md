This release adds the new `/git:pr` command for creating GitHub pull requests directly from Claude Code. The command integrates with `/git:commit` to streamline the workflow from staging changes to opening a PR. Additionally, `/git:commit` has been simplified by removing changelog and version bump steps, which are now handled separately via `/changelog:add` and `/changelog:release`.

## 🚀 Features

### Untitled

Add `/git:pr` command that creates GitHub pull requests. The command switches to a topic branch, delegates to `/git:commit` for staging and committing, then opens a PR using `gh pr create`. It reminds users to run project-specific quality gates before creating the PR.

Also simplify `/git:commit` by removing the changelog and version bump steps—use `/changelog:add` and `/changelog:release` separately.
