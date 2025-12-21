#!/usr/bin/env bash

command -v jq &>/dev/null || exit 1

stdin_data=$(cat)
FILE_PATH=$(echo "$stdin_data" | jq -r '.tool_input.file_path // .tool_output.file_path // empty' 2>/dev/null)

[[ -z "$FILE_PATH" ]] && exit 0

if [[ "$FILE_PATH" =~ \.(cpp|hpp|cpp\.in|hpp\.in)$ ]]; then
  if command -v clang-format &>/dev/null; then
    clang-format -i "$FILE_PATH"
  else
    echo "clang-format not found, skipping auto-formatting" >&2
  fi
fi

if [[ "$FILE_PATH" =~ \.(cmake|CMakeLists\.txt)$ ]]; then
  if command -v cmake-format &>/dev/null; then
    cmake-format --in-place "$FILE_PATH"
  elif command -v uv &>/dev/null; then
    uv tool run cmake-format --in-place "$FILE_PATH"
  else
    echo "cmake-format not found, skipping auto-formatting" >&2
  fi
fi

# -i 2: indent with 2 spaces
# -ci: indent switch cases
# -bn: binary ops may start line
if [[ "$FILE_PATH" =~ \.(sh|bash)$ ]]; then
  if command -v shfmt &>/dev/null; then
    shfmt -i 2 -ci -bn -w "$FILE_PATH"
  else
    echo "shfmt not found, skipping auto-formatting" >&2
  fi
fi

if [[ "$FILE_PATH" =~ \.(md|mdx)$ ]]; then
  if command -v markdownlint &>/dev/null; then
    markdownlint "$FILE_PATH" --fix
  else
    echo "markdownlint not found, skipping auto-formatting" >&2
  fi
fi

if [[ "$FILE_PATH" =~ \.(md|mdx|json|yaml|yml)$ ]]; then
  if command -v prettier &>/dev/null; then
    prettier --write "$FILE_PATH"
  else
    echo "prettier not found, skipping auto-formatting" >&2
  fi
fi
