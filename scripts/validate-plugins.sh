#!/usr/bin/env bash
# Validates the integrity of the Claude plugin structure.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MARKETPLACE_JSON="$REPO_ROOT/.claude-plugin/marketplace.json"
PLUGINS_DIR="$REPO_ROOT/plugins"

errors=0

# Colors for terminal output.
if [ -t 1 ]; then
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  YELLOW='\033[0;33m'
  NC='\033[0m' # No Color
else
  RED=''
  GREEN=''
  YELLOW=''
  NC=''
fi

error() {
  echo -e "${RED}✘${NC} $1" >&2
  errors=$((errors + 1))
}

warn() {
  echo -e "${YELLOW}!${NC} $1" >&2
}

info() {
  echo -e "${GREEN}✔${NC} $1"
}

# Check if required tools are available.
command -v jq >/dev/null 2>&1 || {
  error "jq is required but not installed"
  exit 1
}

# Validate JSON syntax.
validate_json() {
  local file="$1"
  if ! jq empty "$file" 2>/dev/null; then
    error "$file is not valid JSON"
    return 1
  fi
  return 0
}

# Validate SemVer format.
validate_semver() {
  local version="$1"
  local context="$2"
  if ! echo "$version" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9.]+)?(\+[a-zA-Z0-9.]+)?$'; then
    error "$context: '$version' is not a valid SemVer version"
    return 1
  fi
  return 0
}

# Validate YAML frontmatter in markdown files.
validate_frontmatter() {
  local file="$1"
  local required_fields="$2"

  # Check if file starts with ---
  if ! head -1 "$file" | grep -q "^---$"; then
    error "$file: missing YAML frontmatter (must start with ---)"
    return 1
  fi

  # Extract frontmatter (between first and second ---)
  local frontmatter
  frontmatter=$(awk '/^---$/{if(++n==2)exit}n==1' "$file")

  if [ -z "$frontmatter" ]; then
    error "$file: empty or malformed frontmatter"
    return 1
  fi

  # Check required fields
  for field in $required_fields; do
    if ! echo "$frontmatter" | grep -q "^${field}:"; then
      error "$file: missing required frontmatter field '$field'"
    fi
  done

  return 0
}

info "validating Claude plugin structure..."
info "repository root: $REPO_ROOT"

# =============================================================================
# Validate marketplace.json
# =============================================================================

info "checking marketplace.json..."

if [ ! -f "$MARKETPLACE_JSON" ]; then
  error "marketplace manifest not found: $MARKETPLACE_JSON"
  exit 1
fi

validate_json "$MARKETPLACE_JSON"

# Check required top-level fields.
for field in name owner metadata plugins; do
  if ! jq -e ".$field" "$MARKETPLACE_JSON" >/dev/null 2>&1; then
    error "marketplace.json: missing required field '$field'"
  fi
done

# Validate marketplace version.
marketplace_version=$(jq -r '.metadata.version // empty' "$MARKETPLACE_JSON")
if [ -n "$marketplace_version" ]; then
  validate_semver "$marketplace_version" "marketplace.json metadata.version"
fi

# =============================================================================
# Validate enabled plugins in settings.json
# =============================================================================

SETTINGS_JSON="$REPO_ROOT/.claude/settings.json"
MARKETPLACE_NAME=$(jq -r '.name' "$MARKETPLACE_JSON")

if [ -f "$SETTINGS_JSON" ]; then
  info "checking enabled plugins in settings.json..."

  # Extract plugins enabled for this marketplace (e.g., "plugin@tenzir").
  enabled_plugins=$(jq -r ".enabledPlugins // {} | keys[] | select(endswith(\"@$MARKETPLACE_NAME\"))" "$SETTINGS_JSON" 2>/dev/null)

  while IFS= read -r full_plugin_name; do
    [ -z "$full_plugin_name" ] && continue
    # Strip the @marketplace suffix to get the plugin name.
    plugin_name="${full_plugin_name%@*}"

    # Check if plugin exists in marketplace.json.
    if ! jq -e ".plugins[] | select(.name == \"$plugin_name\")" "$MARKETPLACE_JSON" >/dev/null 2>&1; then
      error "settings.json: enabled plugin '$full_plugin_name' not found in marketplace"
    fi
  done < <(echo "$enabled_plugins")
fi

# =============================================================================
# Validate plugins in CI workflow
# =============================================================================

CLAUDE_WORKFLOW="$REPO_ROOT/.github/workflows/claude.yaml"

if [ -f "$CLAUDE_WORKFLOW" ]; then
  info "checking plugins in CI workflow..."

  # Extract plugins from the workflow file (lines with @marketplace suffix).
  workflow_plugins=$(grep -E "^\s+\w+@$MARKETPLACE_NAME\s*$" "$CLAUDE_WORKFLOW" 2>/dev/null | tr -d ' ')

  while IFS= read -r full_plugin_name; do
    [ -z "$full_plugin_name" ] && continue
    # Strip the @marketplace suffix to get the plugin name.
    plugin_name="${full_plugin_name%@*}"

    # Check if plugin exists in marketplace.json.
    if ! jq -e ".plugins[] | select(.name == \"$plugin_name\")" "$MARKETPLACE_JSON" >/dev/null 2>&1; then
      error "claude.yaml: plugin '$full_plugin_name' not found in marketplace"
    fi
  done < <(echo "$workflow_plugins")

  # Check that all marketplace plugins are in the workflow.
  while IFS= read -r plugin_name; do
    [ -z "$plugin_name" ] && continue
    full_plugin_name="${plugin_name}@${MARKETPLACE_NAME}"
    if ! echo "$workflow_plugins" | grep -qx "$full_plugin_name"; then
      error "claude.yaml: marketplace plugin '$full_plugin_name' not listed in workflow"
    fi
  done < <(jq -r '.plugins[].name' "$MARKETPLACE_JSON")
fi

# =============================================================================
# Validate plugins directory sync
# =============================================================================

info "checking plugin directory sync..."

# Get plugins from marketplace.json (sorted).
manifest_plugins=$(jq -r '.plugins[].name' "$MARKETPLACE_JSON" | sort)

# Get actual plugin directories (sorted).
actual_plugins=$(find "$PLUGINS_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)

# Check for plugins in manifest but not in directory.
while IFS= read -r plugin; do
  [ -z "$plugin" ] && continue
  if [ ! -d "$PLUGINS_DIR/$plugin" ]; then
    error "plugin '$plugin' listed in marketplace.json but directory doesn't exist"
  fi
done < <(echo "$manifest_plugins")

# Check for plugin directories not in manifest.
while IFS= read -r plugin; do
  [ -z "$plugin" ] && continue
  if ! echo "$manifest_plugins" | grep -qx "$plugin"; then
    error "plugin directory '$plugin' exists but is not listed in marketplace.json"
  fi
done < <(echo "$actual_plugins")

# =============================================================================
# Validate alphabetical ordering in marketplace.json
# =============================================================================

info "checking alphabetical ordering..."

manifest_plugins_ordered=$(jq -r '.plugins[].name' "$MARKETPLACE_JSON")
manifest_plugins_sorted=$(echo "$manifest_plugins_ordered" | sort)

if [ "$manifest_plugins_ordered" != "$manifest_plugins_sorted" ]; then
  error "marketplace.json: plugins are not sorted alphabetically"
fi

# =============================================================================
# Validate changelog structure (module-based)
# =============================================================================

info "checking changelog structure..."

CHANGELOG_CONFIG="$REPO_ROOT/changelog/config.yaml"
if [ -f "$CHANGELOG_CONFIG" ]; then
  # Check that parent config uses modules pattern
  if ! grep -q "^modules:" "$CHANGELOG_CONFIG"; then
    warn "changelog/config.yaml: missing 'modules' field for module-based setup"
  fi
else
  warn "changelog/config.yaml not found, skipping changelog validation"
fi

# =============================================================================
# Validate source paths in marketplace.json
# =============================================================================

info "checking source paths..."

while IFS= read -r line; do
  name=$(echo "$line" | jq -r '.name')
  source=$(echo "$line" | jq -r '.source')
  expected_source="./plugins/$name"

  if [ "$source" != "$expected_source" ]; then
    error "marketplace.json: plugin '$name' has source '$source', expected '$expected_source'"
  fi
done < <(jq -c '.plugins[]' "$MARKETPLACE_JSON")

# =============================================================================
# Validate each plugin
# =============================================================================

for plugin_dir in "$PLUGINS_DIR"/*/; do
  plugin_name=$(basename "$plugin_dir")
  info "validating plugin: $plugin_name"

  plugin_json="$plugin_dir/.claude-plugin/plugin.json"
  readme="$plugin_dir/README.md"

  # ---------------------------------------------------------------------------
  # Required files
  # ---------------------------------------------------------------------------

  if [ ! -f "$plugin_json" ]; then
    error "$plugin_name: missing .claude-plugin/plugin.json"
    continue
  fi

  if [ ! -f "$readme" ]; then
    error "$plugin_name: missing README.md"
  fi

  # ---------------------------------------------------------------------------
  # Validate plugin.json
  # ---------------------------------------------------------------------------

  validate_json "$plugin_json"

  # Check required fields.
  for field in name version description; do
    if ! jq -e ".$field" "$plugin_json" >/dev/null 2>&1; then
      error "$plugin_name/plugin.json: missing required field '$field'"
    fi
  done

  # Check name matches directory.
  json_name=$(jq -r '.name' "$plugin_json")
  if [ "$json_name" != "$plugin_name" ]; then
    error "$plugin_name: plugin.json name '$json_name' doesn't match directory name"
  fi

  # Validate version.
  version=$(jq -r '.version // empty' "$plugin_json")
  if [ -n "$version" ]; then
    validate_semver "$version" "$plugin_name/plugin.json version"
  fi

  # ---------------------------------------------------------------------------
  # Validate skills
  # ---------------------------------------------------------------------------

  skills_dir="$plugin_dir/skills"
  if [ -d "$skills_dir" ]; then
    for skill_dir in "$skills_dir"/*/; do
      [ -d "$skill_dir" ] || continue
      skill_name=$(basename "$skill_dir")
      skill_file="$skill_dir/SKILL.md"

      if [ ! -f "$skill_file" ]; then
        error "$plugin_name/skills/$skill_name: missing SKILL.md"
        continue
      fi

      validate_frontmatter "$skill_file" "name description"

      # Check skill name in frontmatter matches directory.
      frontmatter_name=$(awk '/^---$/{if(++n==2)exit}n==1' "$skill_file" | grep "^name:" | sed 's/^name: *//')
      if [ -n "$frontmatter_name" ] && [ "$frontmatter_name" != "$skill_name" ]; then
        error "$plugin_name/skills/$skill_name: SKILL.md name '$frontmatter_name' doesn't match directory name"
      fi
    done
  fi

  # ---------------------------------------------------------------------------
  # Validate commands
  # ---------------------------------------------------------------------------

  commands_dir="$plugin_dir/commands"
  if [ -d "$commands_dir" ]; then
    for cmd_file in "$commands_dir"/*.md; do
      [ -f "$cmd_file" ] || continue
      validate_frontmatter "$cmd_file" "description"
    done
  fi

  # ---------------------------------------------------------------------------
  # Validate hooks
  # ---------------------------------------------------------------------------

  hooks_dir="$plugin_dir/hooks"
  hooks_json="$hooks_dir/hooks.json"

  if [ -f "$hooks_json" ]; then
    validate_json "$hooks_json"

    # Check that referenced scripts exist.
    while IFS= read -r command; do
      [ -z "$command" ] && continue
      # Replace $CLAUDE_PLUGIN_ROOT with actual plugin directory.
      resolved_command=$(echo "$command" | sed "s|\\\$CLAUDE_PLUGIN_ROOT|$plugin_dir|g" | sed "s|\\\${CLAUDE_PLUGIN_ROOT}|$plugin_dir|g")

      # Extract the script path (first word of command).
      script_path=$(echo "$resolved_command" | awk '{print $1}')

      if [ ! -f "$script_path" ]; then
        error "$plugin_name/hooks: referenced script not found: $command"
      elif [ ! -x "$script_path" ]; then
        error "$plugin_name/hooks: script is not executable: $command"
      fi
    done < <(jq -r '.. | objects | select(.type == "command") | .command' "$hooks_json" 2>/dev/null)
  fi

  # ---------------------------------------------------------------------------
  # Validate plugin changelog
  # ---------------------------------------------------------------------------

  plugin_changelog_config="$plugin_dir/changelog/config.yaml"
  if [ -f "$plugin_changelog_config" ]; then
    # Check that id matches plugin name
    changelog_id=$(grep "^id:" "$plugin_changelog_config" | sed 's/^id: *//')
    if [ -n "$changelog_id" ] && [ "$changelog_id" != "$plugin_name" ]; then
      error "$plugin_name/changelog: config.yaml id '$changelog_id' doesn't match plugin name"
    fi
  else
    warn "$plugin_name: missing changelog/config.yaml"
  fi

  # ---------------------------------------------------------------------------
  # Validate version synchronization
  # ---------------------------------------------------------------------------

  releases_dir="$plugin_dir/changelog/releases"
  if [ -d "$releases_dir" ]; then
    # Find the latest released version (highest semver).
    # Directories are named vX.Y.Z, we strip the 'v' prefix for comparison.
    latest_release=$(find "$releases_dir" -mindepth 1 -maxdepth 1 -type d -name 'v*' -exec basename {} \; \
      | sed 's/^v//' \
      | sort -t. -k1,1n -k2,2n -k3,3n \
      | tail -1)

    if [ -n "$latest_release" ]; then
      plugin_version=$(jq -r '.version // empty' "$plugin_json")
      if [ -n "$plugin_version" ] && [ "$plugin_version" != "$latest_release" ]; then
        error "$plugin_name: plugin.json version '$plugin_version' doesn't match latest release 'v$latest_release'"
      fi
    fi
  fi
done

# =============================================================================
# Summary
# =============================================================================

if [ $errors -eq 0 ]; then
  info "validation passed"
  exit 0
else
  error "validation failed with $errors error(s)"
  exit 1
fi
