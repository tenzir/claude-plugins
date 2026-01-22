This major release renames the `docs:writing` skill to `docs:authoring` to better reflect its comprehensive scope beyond prose writing. It also introduces an intelligent documentation sync hook that automatically keeps the `.docs/` repository synchronized while preventing conflicts.

## 💥 Breaking changes

### Renamed writing skill to authoring

The `docs:writing` skill has been renamed to `docs:authoring` to better reflect its semantic scope. While "writing" implied only prose style, the skill actually covers the full documentation authoring process: understanding content types via the Diátaxis framework, determining where content belongs, following format conventions, and executing the creation workflow.

All references to `docs:writing` throughout commands and documentation have been updated to use `docs:authoring`.

*By @mavam and @claude.*

## 🚀 Features

### Intelligent documentation sync hook

A new `PreToolUse` hook automatically keeps the `.docs/` repository synchronized when editing documentation files. The hook fetches updates only when the last sync was more than 24 hours ago, avoiding unnecessary network operations.

The hook analyzes repository state to determine the safest action:

- Auto-pulls when on `main` with a clean worktree and fast-forward is possible
- Blocks edits and notifies Claude when merge conflicts are detected
- Detects merged topic branches that should be switched away from

*By @mavam and @claude.*
