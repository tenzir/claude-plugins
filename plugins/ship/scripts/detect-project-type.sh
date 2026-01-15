#!/usr/bin/env bash
# Detects the project type based on configuration files.

if [[ -f .claude-plugin/plugin.json ]]; then
  echo "claude-plugin"
elif [[ -f pyproject.toml ]]; then
  echo "python"
elif [[ -f Cargo.toml ]]; then
  echo "rust"
elif [[ -f package.json ]]; then
  echo "node"
elif [[ -f CMakeLists.txt ]]; then
  echo "cpp"
else
  echo "unknown"
fi
