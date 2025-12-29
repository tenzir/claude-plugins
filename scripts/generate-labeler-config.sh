#!/usr/bin/env bash
# Generate .github/labeler.yml from marketplace.json

set -euo pipefail

MARKETPLACE_JSON=".claude-plugin/marketplace.json"
LABELER_CONFIG=".github/labeler.yml"

cat >"$LABELER_CONFIG" <<'HEADER'
# Auto-generated from marketplace.json by sync-labels workflow
# Do not edit manually

HEADER

jq -r '.plugins[].name' "$MARKETPLACE_JSON" | while read -r plugin; do
  cat >>"$LABELER_CONFIG" <<EOF
plugin:${plugin}:
  - changed-files:
      - any-glob-to-any-file: plugins/${plugin}/**

EOF
done
