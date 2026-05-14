#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
REPO_URL="https://github.com/sxeptical/dotfiles.git"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

link_config() {
    local name="$1"
    local src="$DOTFILES_DIR/$name"
    local dest="$CONFIG_DIR/$name"

    _link "$src" "$dest" "$name"
}

link_home() {
    local name="$1"
    local src="$DOTFILES_DIR/$name/$2"
    local dest="$HOME/$2"

    _link "$src" "$dest" "$name"
}

_link() {
    local src="$1"
    local dest="$2"
    local label="$3"

    if [ -L "$dest" ]; then
        local current_target
        current_target=$(readlink "$dest")
        if [ "$current_target" = "$src" ]; then
            info "$label already linked"
            return
        fi
        warn "$label symlink exists but points to $current_target, replacing"
        rm "$dest"
    elif [ -e "$dest" ]; then
        local backup="$dest.bak.$(date +%s)"
        warn "$label exists, backing up to $backup"
        mv "$dest" "$backup"
    fi

    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    info "linked $label"
}

# Clone dotfiles if not already present
if [ ! -d "$DOTFILES_DIR" ]; then
    info "cloning dotfiles..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    info "dotfiles already cloned, pulling latest..."
    git -C "$DOTFILES_DIR" pull
fi

# Symlink configs
link_config "hypr"
link_config "nvim"
link_config "waybar"
link_home "tmux" ".tmux.conf"

info "setup complete"
