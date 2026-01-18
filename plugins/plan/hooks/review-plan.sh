#!/usr/bin/env bash
#
# PostToolUse hook for ExitPlanMode - Reviews plans with external AI tools.
#
# This hook executes AFTER Claude calls ExitPlanMode. It receives JSON on stdin
# containing tool_input and tool_output from the ExitPlanMode call.
#
# Exit codes:
#   0 - Success (review passed or non-critical issues found)
#   2 - Blocking error (P1 critical issues found, shows stderr to user)
#
# Environment variables:
#   PLAN_REVIEW_DIR         - Directory containing plans (default: .plans)
#   PLAN_REVIEW_TOOLS       - Comma-separated review tools (default: codex,gemini)
#   PLAN_REVIEW_TIMEOUT     - Per-tool timeout in seconds (default: 120)
#   PLAN_REVIEW_BLOCK_ON_P1 - Block on P1 findings (default: true)
#   PLAN_REVIEW_SKIP        - Skip review entirely (default: false)

set -euo pipefail

# Skip if explicitly disabled
[[ "${PLAN_REVIEW_SKIP:-false}" == "true" ]] && exit 0

# Configuration
PLAN_DIR="${PLAN_REVIEW_DIR:-.plans}"
TIMEOUT="${PLAN_REVIEW_TIMEOUT:-120}"
BLOCK_ON_P1="${PLAN_REVIEW_BLOCK_ON_P1:-true}"
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
REVIEW_PROMPT="$SCRIPT_DIR/prompts/review.txt"

# Utility functions
has_cmd() {
  command -v "$1" &>/dev/null
}

# Check for required tools
has_cmd jq || exit 0

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
[[ -z "$PLAN_FILE" || ! -f "$PLAN_FILE" ]] && exit 0

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
  exit 0
fi

# Read the review prompt
if [[ ! -f "$REVIEW_PROMPT" ]]; then
  echo "Warning: Review prompt not found at $REVIEW_PROMPT" >&2
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

  case "$tool" in
    codex)
      timeout "$TIMEOUT" codex --quiet --approval-mode full-auto \
        "$full_prompt" > "$output_file" 2>&1 || true
      ;;
    gemini)
      timeout "$TIMEOUT" gemini "$full_prompt" > "$output_file" 2>&1 || true
      ;;
    *)
      # Generic: assume tool accepts prompt as argument
      timeout "$TIMEOUT" "$tool" "$full_prompt" > "$output_file" 2>&1 || true
      ;;
  esac
}

# Run reviews in parallel
echo "=== Plan Review ===" >&2
echo "Reviewing: $PLAN_FILE" >&2
echo "Tools: ${available_tools[*]}" >&2
echo "" >&2

for tool in "${available_tools[@]}"; do
  run_review "$tool" "$PLAN_FILE" &
done
wait

# Aggregate results
has_p1=false
all_output=""

for tool in "${available_tools[@]}"; do
  output_file="$RESULTS_DIR/$tool.txt"
  if [[ -f "$output_file" && -s "$output_file" ]]; then
    tool_output=$(cat "$output_file")
    all_output+="--- Review by $tool ---"$'\n'"$tool_output"$'\n\n'

    # Check for P1 findings or BLOCK verdict
    if echo "$tool_output" | grep -qE '^\[P1\]|^### \[P1\]|VERDICT:.*BLOCK'; then
      has_p1=true
    fi
  fi
done

# Output combined review
if [[ -n "$all_output" ]]; then
  echo "$all_output" >&2
fi

# Determine exit code
if [[ "$has_p1" == "true" && "$BLOCK_ON_P1" == "true" ]]; then
  echo "Review: BLOCKING - P1 critical issues found" >&2
  exit 2
else
  echo "Review: COMPLETE" >&2
  exit 0
fi
