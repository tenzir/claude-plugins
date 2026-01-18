#!/usr/bin/env bash
#
# PostToolUse hook for ExitPlanMode - Reviews plans with external AI tools.
#
# This hook executes AFTER Claude calls ExitPlanMode. It receives JSON on stdin
# containing tool_input and tool_output from the ExitPlanMode call.
#
# Output:
#   - Exit 0 with JSON: Review approved, systemMessage contains results
#   - Exit 2 with stderr: Review blocked (P1/P2 issues or REVISE/BLOCK verdict)
#
# Environment variables:
#   PLAN_REVIEW_DIR     - Directory containing plans (default: .plans)
#   PLAN_REVIEW_TOOLS   - Comma-separated review tools (default: codex,gemini)
#   PLAN_REVIEW_TIMEOUT - Per-tool timeout in seconds (default: 120)
#   PLAN_REVIEW_BLOCK   - Block on P1/P2 findings or REVISE/BLOCK verdict (default: true)
#   PLAN_REVIEW_SKIP    - Skip review entirely (default: false)

set -euo pipefail

# Helper to output JSON result (requires jq)
output_json() {
  local message="$1"
  jq -n --arg msg "$message" '{continue: true, systemMessage: $msg}'
}

# Skip if explicitly disabled
if [[ "${PLAN_REVIEW_SKIP:-false}" == "true" ]]; then
  echo '{"continue": true}'
  exit 0
fi

# Configuration
PLAN_DIR="${PLAN_REVIEW_DIR:-.plans}"
TIMEOUT="${PLAN_REVIEW_TIMEOUT:-120}"
BLOCK_ENABLED="${PLAN_REVIEW_BLOCK:-true}"
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
REVIEW_PROMPT="$SCRIPT_DIR/prompts/review.txt"

# Utility functions
has_cmd() {
  command -v "$1" &>/dev/null
}

# Cross-platform timeout (macOS uses gtimeout from coreutils)
if has_cmd timeout; then
  TIMEOUT_CMD="timeout"
elif has_cmd gtimeout; then
  TIMEOUT_CMD="gtimeout"
else
  # Fallback: no timeout, just run directly
  TIMEOUT_CMD=""
fi

# Check for required tools
if ! has_cmd jq; then
  echo '{"continue": true}'
  exit 0
fi

# Parse stdin to get context
stdin_data=$(cat)

# Find the plan file from ExitPlanMode input
PLAN_FILE=$(echo "$stdin_data" | jq -r '.tool_input.planFile // empty' 2>/dev/null)

if [[ -z "$PLAN_FILE" || ! -f "$PLAN_FILE" ]]; then
  # Fallback: find most recently modified plan file (within 5 minutes)
  PLAN_FILE=$(find "$PLAN_DIR" -maxdepth 1 -name "*.md" -type f \
    -mmin -5 2>/dev/null | head -1 || true)
fi

# Exit if no plan file found
if [[ -z "$PLAN_FILE" || ! -f "$PLAN_FILE" ]]; then
  echo '{"continue": true}'
  exit 0
fi

# Parse configured tools
IFS=',' read -ra REVIEW_TOOLS <<< "${PLAN_REVIEW_TOOLS:-codex,gemini}"

# Check which tools are available
available_tools=()
for tool in "${REVIEW_TOOLS[@]}"; do
  tool=$(echo "$tool" | xargs)
  if has_cmd "$tool"; then
    available_tools+=("$tool")
  fi
done

# Exit gracefully if no tools available
if [[ ${#available_tools[@]} -eq 0 ]]; then
  echo '{"continue": true}'
  exit 0
fi

# Notify user that review is starting (stderr shown immediately)
tools_list=$(IFS=,; echo "${available_tools[*]}" | sed 's/,/, /g')
echo "Starting plan review with ${tools_list}..." >&2

# Read the review prompt
if [[ ! -f "$REVIEW_PROMPT" ]]; then
  output_json "Plan review skipped: prompt not found at $REVIEW_PROMPT"
  exit 0
fi

PROMPT=$(cat "$REVIEW_PROMPT")

# Create temp directory for results
RESULTS_DIR=$(mktemp -d)
trap 'rm -rf "$RESULTS_DIR"' EXIT

# Run review with a specific tool
run_review() {
  local tool="$1"
  local plan_file="$2"
  local output_file="$RESULTS_DIR/$tool.txt"

  local plan_content
  plan_content=$(cat "$plan_file")

  local full_prompt="$PROMPT

---

# Plan to Review

$plan_content"

  # Build command with optional timeout
  local cmd_prefix=""
  [[ -n "$TIMEOUT_CMD" ]] && cmd_prefix="$TIMEOUT_CMD $TIMEOUT"

  # Capture stdout (actual response) and stderr (banners/errors) separately.
  # Only include stderr if command fails or stdout is empty.
  # Pass prompt via stdin to avoid huge command line arguments in ps output.
  local stderr_file="$RESULTS_DIR/$tool.stderr"
  local exit_code=0

  case "$tool" in
    codex)
      echo "$full_prompt" | $cmd_prefix codex exec --full-auto - \
        > "$output_file" 2> "$stderr_file" || exit_code=$?
      ;;
    gemini)
      echo "$full_prompt" | $cmd_prefix gemini \
        > "$output_file" 2> "$stderr_file" || exit_code=$?
      ;;
    *)
      echo "$full_prompt" | $cmd_prefix "$tool" \
        > "$output_file" 2> "$stderr_file" || exit_code=$?
      ;;
  esac

  # If command failed or stdout is empty, include stderr for debugging
  if [[ $exit_code -ne 0 || ! -s "$output_file" ]]; then
    cat "$stderr_file" >> "$output_file" 2>/dev/null || true
  fi
}

# Run reviews in parallel
for tool in "${available_tools[@]}"; do
  run_review "$tool" "$PLAN_FILE" &
done
wait

# Aggregate results
should_block=false
block_reason=""
all_output=""

for tool in "${available_tools[@]}"; do
  output_file="$RESULTS_DIR/$tool.txt"
  if [[ -f "$output_file" && -s "$output_file" ]]; then
    tool_output=$(cat "$output_file")
    all_output+="# Review by $tool"$'\n\n'"$tool_output"$'\n\n'

    # Check for blocking conditions: P1 findings, BLOCK verdict, or REVISE verdict
    # Use word boundaries to avoid matching template text like "VERDICT: [APPROVE|REVISE|BLOCK]"
    if echo "$tool_output" | grep -qE '^\[P1\]|^### \[P1\]|VERDICT:\s*BLOCK\s*$'; then
      should_block=true
      block_reason="P1 critical issues found"
    elif echo "$tool_output" | grep -qE 'VERDICT:\s*REVISE\s*$'; then
      should_block=true
      block_reason="P2 issues require revision"
    fi
  fi
done

# Determine exit and output (tools_list already set above)
if [[ "$should_block" == "true" && "$BLOCK_ENABLED" == "true" ]]; then
  # Exit 2 blocks the tool; stderr is shown to Claude (JSON in stdout is ignored for exit 2)
  echo "Plan review BLOCKED (${tools_list}): ${block_reason}."$'\n\n'"$all_output" >&2
  exit 2
else
  # Exit 0 with JSON systemMessage adds review to Claude's context
  if [[ -n "$all_output" ]]; then
    output_json "Plan reviewed by ${tools_list}. $all_output"
  else
    output_json "Plan reviewed by ${tools_list} (no findings)."
  fi
  exit 0
fi
