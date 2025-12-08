#!/bin/sh
HOOKS_PATH=$(git config --get core.hooksPath)
echo "$HOOKS_PATH" | grep -q ".githooks" && echo "Hooks already configured" && exit 0
git config core.hooksPath .githooks && find .githooks -type f -exec chmod +x {} \;
echo "Hooks installed"
