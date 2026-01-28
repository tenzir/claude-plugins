#!/usr/bin/env bash

command -v jq &>/dev/null || exit 1

# Check if a command exists
has_cmd() {
  command -v "$1" &>/dev/null
}

find_config_file() {
  local file="$1"
  shift
  local patterns=("$@")
  local dir
  dir=$(dirname "$file")
  while [[ "$dir" != "/" ]]; do
    for pattern in "${patterns[@]}"; do
      # shellcheck disable=SC2086
      if ls "$dir"/$pattern &>/dev/null; then
        # shellcheck disable=SC2086
        echo "$dir"/$pattern
        return 0
      fi
    done
    dir=$(dirname "$dir")
  done
  return 1
}

# Check if a config file exists by walking up from file's directory
has_config() {
  find_config_file "$@" &>/dev/null
}

# Run a PyPI tool, falling back to uv tool run if not installed
run_pypi_tool() {
  local tool="$1"
  shift
  if has_cmd "$tool"; then
    "$tool" "$@"
  elif has_cmd uv; then
    uv tool run "$tool" "$@"
  else
    return 1
  fi
}

# Run a Go tool, falling back to go run if not installed
# Pinned to v3.10.0 for reproducibility (released 2024-10-01)
SHFMT_MODULE="mvdan.cc/sh/v3/cmd/shfmt@v3.10.0"

run_go_tool() {
  local tool="$1"
  local module="$2"
  shift 2
  if has_cmd "$tool"; then
    "$tool" "$@"
  elif has_cmd go; then
    go run "$module" "$@"
  else
    # Neither tool nor Go available - skip silently (consistent with other formatters)
    return 1
  fi
}

# Get changed line ranges from staged git diff for hunk-based formatting
get_changed_lines() {
  local file="$1"
  git diff --cached --unified=0 -- "$file" 2>/dev/null | \
    sed -n 's/^@@ .* +\([0-9]*\),\{0,1\}\([0-9]*\) @@.*/\1 \2/p' | \
    while read -r start count; do
      count=${count:-1}
      if [[ "$count" -gt 0 ]]; then
        echo "$start:$((start + count - 1))"
      fi
    done
}

# Run clang-format, using --lines for staged hunks when available
run_clang_format() {
  local file="$1"
  local lines range
  local -a args
  lines=$(get_changed_lines "$file")
  if [[ -n "$lines" ]]; then
    args=()
    while IFS= read -r range; do
      [[ -n "$range" ]] && args+=("--lines=$range")
    done <<< "$lines"
    clang-format "${args[@]}" -i "$file"
  else
    clang-format -i "$file"
  fi
}

get_clang_format_required_version() {
  local file="$1"
  local version_file
  local version_raw
  local version_parsed
  version_file=$(find_config_file "$file" ".clang-format-version") || return 0
  version_raw=$(head -n 1 "$version_file" 2>/dev/null | tr -d '\r')
  if [[ -n "$version_raw" ]]; then
    version_parsed=$(echo "$version_raw" | grep -Eo '[0-9]+' | head -n 1)
    if [[ -n "$version_parsed" ]]; then
      echo "$version_parsed"
    else
      echo "invalid"
    fi
  else
    echo "invalid"
  fi
}

has_biome_config() {
  has_config "$1" "biome.json" "biome.jsonc"
}

has_eslint_config() {
  has_config "$1" "eslint.config.*" ".eslintrc*"
}

has_prettier_config() {
  has_config "$1" ".prettierrc*" "prettier.config.*"
}

stdin_data=$(cat)
FILE_PATH=$(echo "$stdin_data" | jq -r '.tool_input.file_path // .tool_output.file_path // empty' 2>/dev/null)

[[ -z "$FILE_PATH" ]] && exit 0

if [[ "$FILE_PATH" =~ \.(cpp|hpp|cpp\.in|hpp\.in)$ ]]; then
  if has_cmd clang-format; then
    required_version=$(get_clang_format_required_version "$FILE_PATH")
    if [[ -z "$required_version" ]]; then
      run_clang_format "$FILE_PATH" || true
    elif [[ "$required_version" == "invalid" ]]; then
      echo ".clang-format-version is invalid, skipping auto-formatting" >&2
    else
      clang_format_version=$(clang-format --version 2>/dev/null | sed -E 's/.*version ([0-9]+).*/\1/')
      if [[ "$clang_format_version" == "$required_version" ]]; then
        run_clang_format "$FILE_PATH" || true
      else
        echo "clang-format version mismatch (have ${clang_format_version}, need ${required_version}), skipping" >&2
      fi
    fi
  fi
fi

if [[ "$FILE_PATH" =~ \.(cmake|CMakeLists\.txt)$ ]]; then
  run_pypi_tool cmake-format --in-place "$FILE_PATH" >/dev/null || true
fi

if [[ "$FILE_PATH" =~ \.(md|mdx)$ ]]; then
  if has_cmd markdownlint; then
    markdownlint --fix "$FILE_PATH" >/dev/null || true
  fi
fi

if [[ "$FILE_PATH" =~ \.(md|mdx)$ ]]; then
  if has_cmd prettier; then
    prettier --write "$FILE_PATH" >/dev/null || true
  fi
fi

if [[ "$FILE_PATH" =~ \.(json)$ ]]; then
  if has_biome_config "$FILE_PATH" && has_cmd biome; then
    biome check --write "$FILE_PATH" >/dev/null || true
  elif has_prettier_config "$FILE_PATH" && has_cmd prettier; then
    prettier --write "$FILE_PATH" >/dev/null || true
  fi
fi

if [[ "$FILE_PATH" =~ \.(sh|bash)$ ]]; then
  # Find .editorconfig by walking up from the file's directory to cwd
  dir=$(dirname "$FILE_PATH")
  cwd=$(pwd)
  has_editorconfig=false
  while [[ "$dir" == "$cwd"/* || "$dir" == "$cwd" ]]; do
    if [[ -f "$dir/.editorconfig" ]]; then
      has_editorconfig=true
      break
    fi
    dir=$(dirname "$dir")
  done
  if $has_editorconfig; then
    # Let shfmt use .editorconfig settings
    # Note: shfmt uses absolute paths for .editorconfig lookup, works with go run
    run_go_tool shfmt "$SHFMT_MODULE" -w "$FILE_PATH" || true
  else
    # Fallback defaults:
    # -i 2: indent with 2 spaces
    # -ci: indent switch cases
    # -bn: binary ops may start a line
    run_go_tool shfmt "$SHFMT_MODULE" -i 2 -ci -bn -w "$FILE_PATH" || true
  fi
fi

if [[ "$FILE_PATH" =~ \.(yaml|yml)$ ]]; then
  run_pypi_tool yamllint "$FILE_PATH" >/dev/null || true
fi

if [[ "$FILE_PATH" =~ \.(py)$ ]]; then
  run_pypi_tool ruff format "$FILE_PATH" || true
  run_pypi_tool ruff check --fix "$FILE_PATH" >/dev/null || true
fi

if [[ "$FILE_PATH" =~ \.(js|jsx|ts|tsx|mjs|cjs)$ ]]; then
  if has_biome_config "$FILE_PATH" && has_cmd biome; then
    biome check --write "$FILE_PATH" >/dev/null || true
  elif has_eslint_config "$FILE_PATH" && has_cmd eslint; then
    eslint --fix "$FILE_PATH" >/dev/null || true
  elif has_prettier_config "$FILE_PATH" && has_cmd prettier; then
    prettier --write "$FILE_PATH" >/dev/null || true
  fi
fi
