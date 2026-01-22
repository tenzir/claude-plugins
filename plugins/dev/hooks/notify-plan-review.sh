#!/usr/bin/env bash
#
# PostToolUse hook for EnterPlanMode - Notifies user about plan review.
#
# This hook executes AFTER Claude enters plan mode to inform the user
# that their plan will be reviewed by external AI tools upon exit.
#
# Output: JSON with systemMessage field (added to Claude's context)

set -euo pipefail

# Requires jq for JSON output
command -v jq &>/dev/null || { echo '{"continue": true}'; exit 0; }

# Skip if review is disabled
[[ "${PLAN_REVIEW_SKIP:-false}" == "true" ]] && { echo '{"continue": true}'; exit 0; }

# Check which tools are available
available_tools=()
IFS=',' read -ra REVIEW_TOOLS <<< "${PLAN_REVIEW_TOOLS:-codex,gemini}"
for tool in "${REVIEW_TOOLS[@]}"; do
  tool=$(echo "$tool" | xargs)
  command -v "$tool" &>/dev/null && available_tools+=("$tool")
done

# Output JSON with systemMessage if tools are available
if [[ ${#available_tools[@]} -gt 0 ]]; then
  tools_list=$(IFS=,; echo "${available_tools[*]}" | sed 's/,/, /g')
  msg="Plan review enabled (${tools_list}). P1 findings will block approval."
  jq -n --arg msg "$msg" '{continue: true, systemMessage: $msg}'
else
  echo '{"continue": true}'
fi
