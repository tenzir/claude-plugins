#!/usr/bin/env bash

# Create a persistent review directory with hierarchical structure.
# Outputs the review directory path for use by the review command.
#
# Output format:
#   Review directory: <path>

set -euo pipefail

date_dir=$(date +%Y-%m-%d)
session_id="${CLAUDE_SESSION_ID:-$(date +%H%M%S)}"
review_dir=".reviews/$date_dir/$session_id"

[[ -d "$review_dir" ]] || mkdir -p "$review_dir"
echo "Review directory: $review_dir"
