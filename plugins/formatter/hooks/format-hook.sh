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
      clang-format -i "$FILE_PATH" || true
    elif [[ "$required_version" == "invalid" ]]; then
      echo ".clang-format-version is invalid, skipping auto-formatting" >&2
    else
      clang_format_version=$(clang-format --version 2>/dev/null | sed -E 's/.*version ([0-9]+).*/\1/')
      if [[ "$clang_format_version" == "$required_version" ]]; then
        clang-format -i "$FILE_PATH" || true
      else
        echo "clang-format version mismatch (have ${clang_format_version}, need ${required_version}), skipping" >&2
      fi
    fi
  fi
fi

if [[ "$FILE_PATH" =~ \.(cmake|CMakeLists\.txt)$ ]]; then
  if has_cmd cmake-format; then
    cmake-format --in-place "$FILE_PATH" || true
  elif has_cmd uv; then
    uv tool run cmake-format --in-place "$FILE_PATH" >/dev/null || true
  fi
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
  if has_cmd shfmt; then
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
      shfmt -w "$FILE_PATH" || true
    else
      # Fallback defaults:
      # -i 2: indent with 2 spaces
      # -ci: indent switch cases
      # -bn: binary ops may start a line
      shfmt -i 2 -ci -bn -w "$FILE_PATH" || true
    fi
  fi
fi

if [[ "$FILE_PATH" =~ \.(yaml|yml)$ ]]; then
  if has_cmd yamllint; then
    yamllint "$FILE_PATH" >/dev/null || true
  fi
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
