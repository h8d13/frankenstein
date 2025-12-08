#!/bin/sh
#
# Install git hooks by setting core.hooksPath to .githooks

echo "Installing git hooks..."
git config core.hooksPath .githooks
echo "Git hooks installed! Hooks in .githooks/ will now run automatically."
