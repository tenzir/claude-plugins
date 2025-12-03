#!/bin/bash

# Bail out early if jq is not available
command -v jq &>/dev/null || exit 1

# Read stdin to get file path
stdin_data=$(cat)
FILE_PATH=$(echo "$stdin_data" | jq -r '.tool_input.file_path // .tool_output.file_path // empty' 2>/dev/null)

# Bail out if no file path
[[ -z "$FILE_PATH" ]] && exit 0

# Run clang-format for C++ files
if [[ "$FILE_PATH" =~ \.(cpp|hpp|cpp\.in|hpp\.in)$ ]]; then
  if command -v clang-format &>/dev/null; then
    clang-format -i "$FILE_PATH"
  else
    echo "clang-format not found, skipping auto-formatting" >&2
  fi
fi

# Run cmake-format for CMake files
if [[ "$FILE_PATH" =~ \.(cmake|CMakeLists\.txt)$ ]]; then
  if command -v cmake-format &>/dev/null; then
    cmake-format --in-place "$FILE_PATH"
  elif command -v uv &>/dev/null; then
    uv tool run cmake-format --in-place "$FILE_PATH"
  else
    echo "cmake-format not found, skipping auto-formatting" >&2
  fi
fi

# Run shfmt for shell scripts
if [[ "$FILE_PATH" =~ \.(sh|bash)$ ]]; then
  if command -v shfmt &>/dev/null; then
    shfmt -w "$FILE_PATH"
  else
    echo "shfmt not found, skipping auto-formatting" >&2
  fi
fi

# Run markdownlint for Markdown files
if [[ "$FILE_PATH" =~ \.(md)$ ]]; then
  if command -v markdownlint &>/dev/null; then
    markdownlint "$FILE_PATH" --fix
  else
    echo "markdownlint not found, skipping auto-formatting" >&2
  fi
fi

# Run prettier on supported files
if [[ "$FILE_PATH" =~ \.(md|json|yaml|yml)$ ]]; then
  if command -v prettier &>/dev/null; then
    prettier --write "$FILE_PATH"
  else
    echo "prettier not found, skipping auto-formatting" >&2
  fi
fi
