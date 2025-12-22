#!/usr/bin/env bash
#
# Synchronize the .docs directory for documentation work.
#
# Usage: synchronize-docs.sh [directory]
#
# If directory is not specified, defaults to .docs in the current directory.

set -euo pipefail

DOCS_DIR="${1:-.docs}"
REPO_URL="git@github.com:tenzir/docs.git"

if [[ ! -d "$DOCS_DIR" ]]; then
  echo "Cloning docs repository to $DOCS_DIR..."
  git clone "$REPO_URL" "$DOCS_DIR"
else
  echo "Updating $DOCS_DIR from origin/main..."
  git -C "$DOCS_DIR" fetch origin
  git -C "$DOCS_DIR" pull --ff-only origin main
fi

if [[ ! -d "$DOCS_DIR/node_modules" ]]; then
  echo "Installing dependencies..."
  (cd "$DOCS_DIR" && pnpm install)
else
  echo "Dependencies already installed."
fi

echo "Documentation root ready: $DOCS_DIR"
