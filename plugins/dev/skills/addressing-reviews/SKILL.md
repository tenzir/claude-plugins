---
name: addressing-reviews
description: Address GitHub PR review feedback. Use when responding to reviewers, resolving threads, or handling review comments.
---

# Addressing Review Feedback

Best practices for responding to GitHub PR review comments and resolving threads.

## Response Decision Tree

When addressing a review comment, decide the appropriate action:

### Resolve Without Reply

For straightforward fixes where the change speaks for itself:

- Typo corrections
- Obvious bug fixes
- Simple refactors the reviewer suggested
- Adding missing null checks, error handling

Just fix the code and resolve the thread with a commit reference.

### Reply Then Resolve

For fixes that need brief explanation:

- Non-obvious implementation choices
- Partial fixes (addressing core issue, deferring edge cases)
- Alternative approaches to what was suggested

Reply with a short explanation, then resolve.

### Discuss Before Acting

For comments requiring clarification:

- Ambiguous feedback
- Suggestions that conflict with other requirements
- Requests that seem to misunderstand the intent
- Significant architectural changes

Ask clarifying questions before implementing.

### Respectfully Disagree

When you believe the current approach is correct:

- Explain the reasoning behind the current design
- Cite relevant constraints or requirements
- Offer to discuss further if they have concerns
- Do NOT resolve - let the reviewer decide

## Communication Guidelines

### Keep Replies Concise

Bad:

> Thank you so much for catching this! You're absolutely right that this could cause issues. I've updated the code to use parameterized queries as you suggested. Let me know if you have any other concerns!

Good:

> Fixed in abc1234. Using parameterized queries now.

### Focus on Facts

Bad:

> I thought about this a lot and I really think the current approach is better because it feels more natural to me.

Good:

> Kept the current approach because it handles the edge case in line 45 where `config` can be undefined. The suggested change would require additional null checks upstream.

### Acknowledge Valid Points

When a reviewer catches a real issue:

> Good catch. Fixed in abc1234.

When partially agreeing:

> Agreed on the naming. Kept the structure since it matches the pattern in `OtherClass`.

### Handle Disagreements

When you disagree with feedback:

1. Acknowledge their perspective
2. Explain your reasoning with specifics
3. Offer alternatives if possible
4. Leave thread open for discussion

Example:

> I see the concern about complexity. Kept the current approach because:
>
> - It handles the concurrent access case (line 78-82)
> - Matches the pattern used in `similar_module.ts`
>
> Open to refactoring if there's a simpler way to handle the concurrency.

## Thread Resolution

### When to Resolve

Resolve threads when:

- You've addressed the feedback (fix committed and pushed)
- The reviewer explicitly says "no action needed" or similar
- It's your own comment/question that's been answered

Do NOT resolve:

- Before pushing the fix
- When the reviewer asked a question you haven't answered
- When you disagree (let reviewer close after discussion)
- When marked as "blocking" and not yet addressed

### GraphQL Patterns

**Reply to a thread:**

```sh
gh api graphql -f query='
mutation {
  addPullRequestReviewThreadReply(input: {
    pullRequestReviewThreadId: "PRRT_xxx"
    body: "Fixed in abc1234."
  }) { comment { id } }
}'
```

**Resolve a thread:**

```sh
gh api graphql -f query='
mutation {
  resolveReviewThread(input: {
    threadId: "PRRT_xxx"
  }) { thread { isResolved } }
}'
```

**Get thread ID from comment:**

The thread ID format is `PRRT_xxx` (PR Review Thread). When processing GIT-\*
findings from the GitHub reviewer, the thread ID is included in the finding
metadata.

### Reply Content Patterns

**Simple fix:**

> Fixed in {commit_sha}.

**Fix with context:**

> Fixed in {commit_sha}. Using {approach} because {reason}.

**Multiple related fixes:**

> Addressed in {commit_sha}:
>
> - Fixed null check (line 45)
> - Added validation (line 52)

**Deferred action:**

> Tracking in #{issue_number}. Out of scope for this PR.

## Batch Operations

When addressing multiple related comments:

1. Make all fixes in a single logical commit
2. Reply to each thread referencing the same commit
3. Resolve threads after all replies are posted

This keeps the commit history clean and makes it easy for reviewers to verify
all their feedback was addressed.
