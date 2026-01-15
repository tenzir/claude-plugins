---
description: Create a pull request for documentation changes in .docs/
---

# Create Documentation PR

Create a PR for documentation changes in `.docs/`, with automatic cross-referencing
to any companion PR in the parent project.

At any step, if there are errors, report them and stop.

## 1. Verify changes

Check for uncommitted changes in `.docs/`:

```bash
cd .docs && git status --porcelain
```

If there are no changes, stop.

## 2. Run linting

```bash
cd .docs && bun run lint:fix
```

If linting fails, fix issues before proceeding. Skip `build:linkcheck`
locally—CI runs it on the PR.

## 3. Detect outer PR

Check if the parent repository has an open PR:

```bash
# From project root (parent of .docs/)
gh pr view --json number,url,body 2>/dev/null
```

- If successful: Store `OUTER_PR_NUMBER` and `OUTER_PR_URL`
- If fails: No outer PR exists, proceed without cross-reference

## 4. Create docs PR

Change directory to `.docs/` and execute `/git:pr`.

When composing the PR body, include a "Related PRs" section if an outer PR exists:

```markdown
## Summary

<Brief description of documentation changes>

## Related PRs

- Parent: <OUTER_PR_URL>
```

Omit the "Related PRs" section if no outer PR was detected.

Capture the created docs PR URL from the output.

## 5. Cross-reference outer PR

If an outer PR was detected in step 3:

1. Check if outer PR body already contains a reference to `tenzir/docs#`
2. If not, append to the outer PR body:

```bash
gh pr edit <OUTER_PR_NUMBER> --body-file <temp-file>
```

Where the temp file contains the existing body plus:

```markdown
## Related PRs

- Documentation: <DOCS_PR_URL>
```

If the outer PR already has a "Related PRs" section, append the documentation
link to that section instead of creating a new one.

## 6. Report results

Summarize:

- **Docs PR**: Link to the created documentation PR
- **Cross-referenced**: Whether the outer PR was updated (and its URL)
- **Linting**: Confirm linting passed
