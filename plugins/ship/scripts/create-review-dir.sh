#!/usr/bin/env bash

# Create a persistent review directory with hierarchical structure.
# Idempotent: exits early if directory already exists.

set -euo pipefail

date_dir=$(date +%Y-%m-%d)
session_id="${CLAUDE_SESSION_ID:-$(date +%H%M%S)}"
review_dir=".reviews/$date_dir/$session_id"

[[ -d "$review_dir" ]] && exit 0

mkdir -p "$review_dir"
