#!/usr/bin/env bash
# Detect documentation root path for Tenzir docs operations.
# Outputs the path to stdout.

if git remote get-url origin 2>/dev/null | grep -q 'tenzir/docs'; then
  echo "."
else
  echo ".tenzir-docs"
fi
