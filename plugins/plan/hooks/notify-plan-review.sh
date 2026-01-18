#!/usr/bin/env bash
#
# PostToolUse hook for EnterPlanMode - Notifies user about plan review.
#
# This hook executes AFTER Claude enters plan mode to inform the user
# that their plan will be reviewed by external AI tools upon exit.

set -euo pipefail

# Debug: log that hook was triggered
echo "[plan-review] EnterPlanMode hook triggered" >&2

# Skip if review is disabled
[[ "${PLAN_REVIEW_SKIP:-false}" == "true" ]] && exit 0

# Check which tools are available
available_tools=()
IFS=',' read -ra REVIEW_TOOLS <<< "${PLAN_REVIEW_TOOLS:-codex,gemini}"
for tool in "${REVIEW_TOOLS[@]}"; do
  tool=$(echo "$tool" | xargs)
  if command -v "$tool" &>/dev/null; then
    available_tools+=("$tool")
  fi
done

# Only show message if at least one tool is available
if [[ ${#available_tools[@]} -gt 0 ]]; then
  cat >&2 <<EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📋 Plan Review Enabled
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
When you exit plan mode, your plan will be reviewed by: ${available_tools[*]}

Reviews evaluate: completeness, correctness, feasibility, risk, and clarity.
P1 (critical) findings will block approval. Set PLAN_REVIEW_SKIP=true to disable.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
fi

exit 0
