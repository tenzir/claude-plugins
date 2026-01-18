#!/usr/bin/env bash
#
# PreToolUse hook for ExitPlanMode - Notifies user that plan review is starting.
#
# Output: JSON with systemMessage field

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
  msg="Starting plan review with ${tools_list}..."
  jq -n --arg msg "$msg" '{continue: true, systemMessage: $msg}'
else
  echo '{"continue": true}'
fi
