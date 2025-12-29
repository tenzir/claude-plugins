#!/usr/bin/env bash
# Sync GitHub labels from marketplace.json
# Creates labels for current plugins, deletes labels for removed plugins

set -euo pipefail

LABEL_PREFIX="plugin:"
MARKETPLACE_JSON=".claude-plugin/marketplace.json"

# Convert HSL to RGB hex color
# Args: hue (0-360), saturation (0-1), lightness (0-1)
hsl_to_rgb() {
  echo "$1 $2 $3" | awk '{
    h = $1 / 360
    s = $2
    l = $3
    if (s == 0) {
      r = g = b = l
    } else {
      q = l < 0.5 ? l * (1 + s) : l + s - l * s
      p = 2 * l - q
      r = h + 1/3; g = h; b = h - 1/3
      if (r < 0) r += 1; if (r > 1) r -= 1
      if (g < 0) g += 1; if (g > 1) g -= 1
      if (b < 0) b += 1; if (b > 1) b -= 1
      r = r < 1/6 ? p + (q - p) * 6 * r : r < 1/2 ? q : r < 2/3 ? p + (q - p) * (2/3 - r) * 6 : p
      g = g < 1/6 ? p + (q - p) * 6 * g : g < 1/2 ? q : g < 2/3 ? p + (q - p) * (2/3 - g) * 6 : p
      b = b < 1/6 ? p + (q - p) * 6 * b : b < 1/2 ? q : b < 2/3 ? p + (q - p) * (2/3 - b) * 6 : p
    }
    printf "%02x%02x%02x\n", int(r * 255), int(g * 255), int(b * 255)
  }'
}

# Get current plugins from marketplace.json (sorted for consistent color assignment)
plugins=$(jq -r '.plugins[].name' "$MARKETPLACE_JSON" | sort)
plugin_count=$(echo "$plugins" | wc -l | tr -d ' ')

# Get existing plugin labels from GitHub
existing_labels=$(gh label list --json name --jq ".[] | select(.name | startswith(\"${LABEL_PREFIX}\")) | .name")

# Create or update labels for current plugins with evenly-spaced hues
index=0
for plugin in $plugins; do
  label="${LABEL_PREFIX}${plugin}"
  description=$(jq -r --arg name "$plugin" '.plugins[] | select(.name == $name) | .description' "$MARKETPLACE_JSON")
  # Evenly space hues around the color wheel
  hue=$((360 * index / plugin_count))
  color=$(hsl_to_rgb "$hue" 0.65 0.45)
  echo "Syncing label: ${label} (${color})"
  gh label create "${label}" \
    --description "${description}" \
    --color "${color}" \
    --force
  index=$((index + 1))
done

# Delete labels for removed plugins
for label in $existing_labels; do
  plugin_name="${label#$LABEL_PREFIX}"
  if ! echo "$plugins" | grep -qx "$plugin_name"; then
    echo "Deleting stale label: ${label}"
    gh label delete "${label}" --yes
  fi
done
