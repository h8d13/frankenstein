#!/bin/sh
# Sway mod - meant to be run as root through doas
# doas
set -e

USER="${DOAS_USER:-$1}"

echo "[MOD] Setting up Sway..."
setup-desktop sway

echo "[MOD] Setting up dotfiles..."
mkdir -p /home/"$USER"/.config/sway

git clone --depth 1 https://github.com/h8d13/swaydots /home/"$USER"/.swaydots
cd /home/"$USER"/.swaydots && ./linker.sh

echo "[MOD] Resetting perms..."
chown -R "$USER":"$USER" "/home/$USER/"

# Add user to required groups
echo "[MOD] Adding $USER to groups: input, video, seat, audio..."
for group in input video seat audio; do
    # Create group if it doesn't exist
    if ! getent group "$group" >/dev/null 2>&1; then
        addgroup "$group"
    fi
    adduser "$USER" "$group"
done
