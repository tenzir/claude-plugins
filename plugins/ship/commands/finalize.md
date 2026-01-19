---
description: Add changelog entry, commit, and push
context: fork
model: sonnet
---

# Finalize Changes

Create a changelog entry, commit all changes, and push.

## 1. Verify Changes Exist

Check for uncommitted changes:

```sh
git status --porcelain
```

If there are no changes, stop with a message explaining nothing to finalize.

## 2. Create Changelog Entry

Spawn @ship:adder to create a changelog entry. The adder detects existing
entries and skips creation if one already exists for these changes.

## 3. Commit Changes

Spawn @git:committer to commit all changes including the changelog entry. The
committer expects staged changes and creates a conventional commit message.

## 4. Push to Remote

Push the commit to the remote.

## 5. Create PR if Needed

Check if a PR exists for the current branch:

```sh
gh pr view --json number,url
```

If no PR exists, invoke /git:pr to create one.

## 6. Report Results

Summarize what was done:

- Changelog entry created
- Commit SHA
- PR URL
