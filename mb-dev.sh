#!/bin/sh
HOOKS_PATH=$(git config --get core.hooksPath)
if echo "$HOOKS_PATH" | grep -q ".githooks"; then
  echo "Hooks already configured"
else
  git config core.hooksPath .githooks && find .githooks -type f -exec chmod +x {} \; && echo "Hooks installed"
fi
awk NF deps-dev | while read -r dep; do
  which "$dep" || echo "$dep: Missing"
done
