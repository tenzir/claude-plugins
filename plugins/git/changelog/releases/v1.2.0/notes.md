This release introduces the `/git:address-pr-comments` command for systematically working through GitHub PR review comments. The command creates one commit per comment, replies with the commit SHA, and resolves threads automatically. It also includes fixes for branch pushing before PR creation and multi-line review comment support.

## 🚀 Features

### Slash command to address PR review comments

The new `/git:address-pr-comments` command works through GitHub PR review comments systematically. It creates one commit per comment (or group of related comments), replies with the commit SHA, and resolves threads automatically.

*By @mavam and @claude.*

## 🐞 Bug fixes

### Explicit branch push before PR creation

The `/git:pr` command now explicitly pushes the current branch to origin before creating the pull request. This prevents the error "you must first push the current branch to a remote" that occurred when `gh pr create` attempted to create a PR from an unpushed branch.

Previously, the command relied on `gh pr create` to push automatically, but this behavior was unreliable. The command now uses `git push -u origin HEAD` to ensure the branch exists on the remote before invoking `gh pr create`.

*By @mavam and @claude.*

### Multi-line review comment support in address-pr-comments command

The `/git:address-pr-comments` command now handles multi-line review comments correctly. When a reviewer selects multiple lines while adding a comment, the command fetches the `startLine` field to determine the full range of the comment, from `startLine` to `line` (inclusive).

*By @mavam and @claude.*
