/**
 * Poll for changelog reactions on open PRs.
 * This script is called by the changelog-poll workflow every minute.
 */
module.exports = async ({ github, context }) => {
  const MARKER = "<!-- changelog-adder-bot -->";
  const REACTION_MAP = {
    "+1": "accept",
    "-1": "reject",
    confused: "regenerate",
    rocket: "more-technical",
    eyes: "less-technical",
    laugh: "more-cynical",
  };

  // Find open PRs
  const { data: prs } = await github.rest.pulls.list({
    owner: context.repo.owner,
    repo: context.repo.repo,
    state: "open",
    per_page: 100,
  });

  console.log(`Found ${prs.length} open PRs`);

  for (const pr of prs) {
    // Get comments on this PR
    const { data: comments } = await github.rest.issues.listComments({
      owner: context.repo.owner,
      repo: context.repo.repo,
      issue_number: pr.number,
    });

    // Find changelog bot comment
    const botComment = comments.find((c) => c.body.includes(MARKER));
    if (!botComment) continue;

    // Skip if not pending
    if (!botComment.body.includes("<!-- status:pending -->")) {
      console.log(`PR #${pr.number}: Skipping (not pending)`);
      continue;
    }

    // Get reactions on this comment
    const { data: reactions } =
      await github.rest.reactions.listForIssueComment({
        owner: context.repo.owner,
        repo: context.repo.repo,
        comment_id: botComment.id,
      });

    if (reactions.length === 0) {
      console.log(`PR #${pr.number}: No reactions yet`);
      continue;
    }

    // Extract processed reactions from comment
    const processedMatch = botComment.body.match(
      /<!-- processed-reactions:(.*?) -->/
    );
    const processed = processedMatch
      ? processedMatch[1].split(",").filter(Boolean)
      : [];

    // Find new reactions to process
    for (const reaction of reactions) {
      const reactionKey = `${reaction.content}:${reaction.user.login}`;
      if (processed.includes(reactionKey)) continue;

      const action = REACTION_MAP[reaction.content];
      if (!action) {
        console.log(
          `PR #${pr.number}: Ignoring unsupported reaction ${reaction.content}`
        );
        continue;
      }

      console.log(
        `PR #${pr.number}: Dispatching ${action} for reaction ${reaction.content} by ${reaction.user.login}`
      );

      // Dispatch the reactor workflow
      await github.rest.actions.createWorkflowDispatch({
        owner: context.repo.owner,
        repo: context.repo.repo,
        workflow_id: "changelog-react.yaml",
        ref: pr.head.ref,
        inputs: {
          pr_number: String(pr.number),
          comment_id: String(botComment.id),
          action: action,
          reactor: reaction.user.login,
        },
      });

      // Only process one reaction at a time per PR
      break;
    }
  }
};
