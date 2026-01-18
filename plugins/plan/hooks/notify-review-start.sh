#!/usr/bin/env bash
#
# PreToolUse hook for ExitPlanMode - Notifies user that plan review is starting.
#
# ============================================================================
# WHY THIS HOOK EXISTS (AND WHY IT MIGHT NOT WORK YET)
# ============================================================================
#
# This hook attempts to display "Starting plan review with X, Y..." to the user
# BEFORE the ExitPlanMode tool executes and the PostToolUse review hook runs.
#
# We use the same JSON output format that works for PostToolUse hooks:
#
#   {"continue": true, "systemMessage": "..."}
#
# For PostToolUse hooks, this displays as:
#
#   ⎿ PostToolUse:ToolName says: <systemMessage content>
#
# However, as of January 2025, PreToolUse hooks do NOT display systemMessage
# content to users in the same way. We tried several approaches:
#
#   1. systemMessage in JSON output     → Not displayed (works for PostToolUse)
#   2. Writing to stderr with exit 0    → Not displayed
#   3. hookSpecificOutput.permissionDecisionReason → Not displayed
#   4. hookSpecificOutput.additionalContext → Only goes to Claude's context
#
# The Claude Code documentation states that for exit code 0, stdout is "shown
# to the user in verbose mode (ctrl+o)" - but systemMessage should be shown
# regardless. This appears to be a gap in PreToolUse hook support.
#
# We're keeping this hook with the standard JSON output format so that:
#   - If/when Claude Code adds PreToolUse message display, it will "just work"
#   - The hook structure matches our other hooks for consistency
#   - Future maintainers understand what we intended
#
# See: https://docs.anthropic.com/en/docs/claude-code/hooks
# ============================================================================

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

# Output JSON with systemMessage (hoping future Claude Code versions will display it)
if [[ ${#available_tools[@]} -gt 0 ]]; then
  tools_list=$(IFS=,; echo "${available_tools[*]}" | sed 's/,/, /g')
  msg="Starting plan review with ${tools_list}..."
  jq -n --arg msg "$msg" '{continue: true, systemMessage: $msg}'
else
  echo '{"continue": true}'
fi
