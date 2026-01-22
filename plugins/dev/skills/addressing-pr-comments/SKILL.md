---
name: addressing-pr-comments
description: Address GitHub PR review comments with commits. Use when working through PR feedback, resolving review threads, or fixing code based on reviewer suggestions.
---

# Address PR Review Comments

Work through GitHub PR review comments, creating one commit per comment (or
group of related comments), then reply with the commit SHA and resolve the
thread.

## 1. Identify the PR

If a PR number was provided, use it. Otherwise, get the PR for the current branch:

```sh
gh pr view --json number --jq '.number'
```

If no PR exists for the current branch, report and stop.

## 2. Fetch review comments

Get all unresolved review threads using GraphQL:

```sh
gh api graphql -f query='
{
  repository(owner: "OWNER", name: "REPO") {
    pullRequest(number: PR_NUMBER) {
      reviewThreads(first: 50) {
        nodes {
          id
          isResolved
          comments(first: 10) {
            nodes {
              body
              path
              line
              startLine
            }
          }
        }
      }
    }
  }
}'
```

When `startLine` is present (not null), the comment applies to a range from
`startLine` to `line` (inclusive). This typically indicates the reviewer
selected multiple lines when adding the comment.

Extract owner and repo from `gh repo view --json owner,name`.

If all threads are resolved, report "No unresolved comments" and stop.

## 3. Group comments by theme

Analyze the unresolved comments and group them if they share a common theme:

- Same type of fix across multiple files (e.g., renaming, terminology)
- Related changes in the same file
- Comments that reference each other ("Same here", "Ditto")

Present the grouping to the user for confirmation before proceeding.

## 4. Address each comment or group

Process all comments or groups in sequence. For each one:

### 4.1 Understand the feedback

Read the referenced file(s) and understand the requested change. If the comment
includes a `suggestion` code block, that's the exact change requested.

If the comment is unclear or seems incorrect, use `AskUserQuestion` to ask the
user how to proceed:

- Apply the suggestion as-is
- Apply with modifications (describe)
- Skip this comment
- Other

### 4.2 Make the fix

Apply the requested changes to the file(s).

### 4.3 Commit and push the fix

Use the @dev:committer agent to commit the fix, then push immediately:

```sh
git push
```

### 4.4 Reply and resolve

Reply to the thread with the commit SHA:

```sh
gh api graphql -f query='
mutation {
  addPullRequestReviewThreadReply(input: {
    pullRequestReviewThreadId: "THREAD_ID"
    body: "Addressed in COMMIT_SHA."
  }) { comment { id } }
}'
```

If the fix clearly addresses the comment, resolve the thread:

```sh
gh api graphql -f query='
mutation {
  resolveReviewThread(input: {
    threadId: "THREAD_ID"
  }) { thread { isResolved } }
}'
```

If you're unsure whether the fix fully addresses the comment, ask the user
whether to resolve it.

## 5. Report summary

After processing all comments, display a summary and exit:

- Number of comments addressed
- Commits created
- Threads resolved
