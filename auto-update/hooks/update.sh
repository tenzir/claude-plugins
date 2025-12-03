#!/bin/bash
# Auto-update the tenzir marketplace on session start

MARKETPLACE_DIR="$HOME/.claude/plugins/marketplaces/tenzir"

# Bail out if marketplace not installed
[[ -d "$MARKETPLACE_DIR" ]] || exit 0

# Pull latest changes
cd "$MARKETPLACE_DIR" && git pull --ff-only --quiet 2>/dev/null || true
