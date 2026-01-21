#!/usr/bin/env bash
#
# Pre-tool hook to ensure .docs/ is cloned and synchronized.
#
# Usage:
#   synchronize-docs.sh --init   # One-time: clone if missing
#   synchronize-docs.sh          # Normal: staleness check and sync

set -euo pipefail

DOCS_DIR=".docs"
DOCS_REPO="git@github.com:tenzir/docs.git"
SYNC_STATE_FILE="$DOCS_DIR/.git/claude-last-sync"
STALE_SECONDS=$((24 * 60 * 60)) # 24 hours

warn() {
  echo "Warning: $1" >&2
}

# Blocking warning - shown to Claude, prevents the edit
block() {
  echo "$1" >&2
  exit 2
}

# Exit early if we're inside the docs repo itself (not a .docs clone)
if git remote get-url origin 2>/dev/null | grep -q "tenzir/docs"; then
  exit 0
fi

# --- Init mode: just clone if missing ---

if [[ "${1:-}" == "--init" ]]; then
  if [[ ! -d "$DOCS_DIR/.git" ]]; then
    echo "Cloning docs repository to $DOCS_DIR..." >&2
    if ! git clone "$DOCS_REPO" "$DOCS_DIR"; then
      block "Failed to clone docs repository. Check SSH keys and network."
    fi
    date +%s >"$SYNC_STATE_FILE"
  fi
  exit 0
fi

# --- Normal mode: staleness check and sync ---

# Ensure jq is available
if ! command -v jq &>/dev/null; then
  warn "jq not found, skipping sync"
  exit 0
fi

# Parse file path from stdin
stdin_data=$(cat)
FILE_PATH=$(echo "$stdin_data" | jq -r '.tool_input.file_path // empty' 2>/dev/null)

[[ -z "$FILE_PATH" ]] && exit 0

# Only act on files inside .docs/
if [[ "$FILE_PATH" != */.docs/* ]] && [[ "$FILE_PATH" != .docs/* ]]; then
  exit 0
fi

# Skip if .docs/ doesn't exist (--init should have run first)
[[ -d "$DOCS_DIR/.git" ]] || exit 0

# --- Staleness Check ---

is_fresh() {
  [[ -f "$SYNC_STATE_FILE" ]] || return 1
  local last_sync now age
  last_sync=$(cat "$SYNC_STATE_FILE" 2>/dev/null) || return 1
  now=$(date +%s)
  age=$((now - last_sync))
  [[ $age -lt $STALE_SECONDS ]]
}

if is_fresh; then
  exit 0
fi

# --- Stale: Fetch and Analyze ---

echo "Fetching origin (last sync >24h ago)..." >&2
git -C "$DOCS_DIR" fetch origin 2>/dev/null || {
  warn "Failed to fetch origin"
  exit 0
}

# Update timestamp after successful fetch
date +%s >"$SYNC_STATE_FILE"

# --- Analyze State ---

current_branch=$(git -C "$DOCS_DIR" rev-parse --abbrev-ref HEAD 2>/dev/null)
is_dirty=$(git -C "$DOCS_DIR" status --porcelain 2>/dev/null)

# Check if current branch is merged into origin/main
is_branch_merged() {
  local branch="$1"
  git -C "$DOCS_DIR" merge-base --is-ancestor "$branch" origin/main 2>/dev/null
}

# Check if we can fast-forward to origin/main
can_fast_forward() {
  local local_head origin_head
  local_head=$(git -C "$DOCS_DIR" rev-parse HEAD 2>/dev/null)
  origin_head=$(git -C "$DOCS_DIR" rev-parse origin/main 2>/dev/null)
  [[ "$local_head" != "$origin_head" ]] \
    && git -C "$DOCS_DIR" merge-base --is-ancestor HEAD origin/main 2>/dev/null
}

# Check if merge with origin/main would be clean (Git 2.38+)
would_merge_cleanly() {
  local result
  result=$(git -C "$DOCS_DIR" merge-tree --write-tree HEAD origin/main 2>&1) || return 1
  # merge-tree outputs just the tree hash on success, includes "CONFLICT" on failure
  [[ "$result" != *"CONFLICT"* ]]
}

if [[ "$current_branch" == "main" ]]; then
  if [[ -z "$is_dirty" ]]; then
    # Clean worktree on main
    if can_fast_forward; then
      echo "Pulling latest changes..." >&2
      git -C "$DOCS_DIR" pull --ff-only origin main 2>/dev/null || {
        warn "Failed to pull, manual sync may be needed"
      }
    elif ! git -C "$DOCS_DIR" merge-base --is-ancestor origin/main HEAD 2>/dev/null; then
      # origin/main is not ancestor of HEAD = diverged
      block "Local main has diverged from origin/main. Run 'cd .docs && git rebase origin/main' to sync."
    fi
    # else: origin/main is ancestor of HEAD = we're ahead, that's fine
  else
    # Dirty worktree on main
    if ! would_merge_cleanly; then
      block "origin/main has changes that conflict with your uncommitted work. Commit or stash changes, then rebase."
    fi
  fi
else
  # On a topic branch
  if is_branch_merged "$current_branch"; then
    warn "Branch '$current_branch' was merged to main, switching to main"
    git -C "$DOCS_DIR" switch main 2>/dev/null || {
      warn "Failed to switch to main"
      exit 0
    }
    git -C "$DOCS_DIR" pull --ff-only origin main 2>/dev/null || {
      warn "Failed to pull latest changes"
    }
  elif ! would_merge_cleanly; then
    block "origin/main has changes that conflict with branch '$current_branch'. Rebase onto origin/main to resolve."
  fi
fi

exit 0
