#!/usr/bin/env bash
# Syncs the docs skill from the latest GitHub release.
# Downloads tenzir-skill.tar.gz and extracts it to skills/docs/.
# Uses a 24-hour cache to avoid redundant downloads.
#
# Usage:
#   sync-docs-skill.sh              # Blocking sync (for PreToolUse hooks)
#   sync-docs-skill.sh --non-blocking  # Background sync (for SessionStart hooks)

set -euo pipefail

SKILL_DIR="${CLAUDE_PLUGIN_ROOT}/skills/docs"
CACHE_FILE="${SKILL_DIR}/.last-sync"
TARBALL_URL="https://github.com/tenzir/docs/releases/download/latest/tenzir-skill.tar.gz"
MAX_AGE_SECONDS=$((24 * 3600))  # 24 hours

# Parse arguments
NON_BLOCKING=false
if [[ "${1:-}" == "--non-blocking" ]]; then
  NON_BLOCKING=true
fi

# Create skill directory if needed
mkdir -p "$SKILL_DIR"

# Determine if sync is needed
needs_sync=false
if [[ ! -f "$CACHE_FILE" ]]; then
  needs_sync=true
elif [[ ! -f "${SKILL_DIR}/SKILL.md" ]]; then
  needs_sync=true
else
  last_sync=$(cat "$CACHE_FILE" 2>/dev/null || echo "0")
  now=$(date +%s)
  age=$((now - last_sync))
  if ((age >= MAX_AGE_SECONDS)); then
    needs_sync=true
  fi
fi

if [[ "$needs_sync" != "true" ]]; then
  # Skill is up to date, no action needed
  exit 0
fi

# Sync function - downloads, extracts, and patches the skill
sync_skill() {
  local temp_dir
  temp_dir=$(mktemp -d)
  trap "rm -rf '$temp_dir'" EXIT

  if ! curl -sL --fail "$TARBALL_URL" -o "$temp_dir/skill.tar.gz" 2>/dev/null; then
    return 1
  fi

  # Clear old content
  find "$SKILL_DIR" -mindepth 1 -exec rm -rf {} + 2>/dev/null || true

  # Extract new content
  tar -xzf "$temp_dir/skill.tar.gz" -C "$SKILL_DIR"

  # Patch SKILL.md name to match directory ('docs' instead of 'tenzir')
  if [[ -f "${SKILL_DIR}/SKILL.md" ]]; then
    sed -i.bak 's/^name: tenzir$/name: docs/' "${SKILL_DIR}/SKILL.md"
    rm -f "${SKILL_DIR}/SKILL.md.bak"
  fi

  # Update timestamp
  date +%s > "$CACHE_FILE"
}

if [[ "$NON_BLOCKING" == "true" ]]; then
  # Background sync - fork and exit immediately
  (sync_skill 2>/dev/null &)
  jq -n '{
    "continue": true,
    "additionalContext": "Docs skill sync started in background."
  }'
else
  # Blocking sync - wait for completion
  if sync_skill; then
    jq -n '{
      "continue": true,
      "additionalContext": "Docs skill synced from latest release."
    }'
  else
    # Network failure - use cached version if available
    if [[ -f "${SKILL_DIR}/SKILL.md" ]]; then
      jq -n '{
        "continue": true,
        "additionalContext": "Warning: Could not sync docs skill (network error). Using cached version."
      }'
    else
      jq -n '{
        "continue": true,
        "additionalContext": "Warning: Could not download docs skill (network error). The tenzir:docs skill is unavailable."
      }'
    fi
  fi
fi
