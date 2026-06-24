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
    local relpath="$1"
    local file
    file="$(basename "$relpath")"
    local src="$DOTFILES_DIR/$relpath"
    local dest="$HOME/$file"

    _link "$src" "$dest" "$relpath"
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

setup_hyprland() {
    link_config "hypr"
    link_config "waybar"
}

setup_all() {
    setup_hyprland
    link_config "nvim"
    link_home "tmux/.tmux.conf"
    link_home "tmux/.tmux.conf.local"
}

# Clone dotfiles if not already present
if [ ! -d "$DOTFILES_DIR" ]; then
    info "cloning dotfiles..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    info "dotfiles already cloned, pulling latest..."
    git -C "$DOTFILES_DIR" pull
fi

# Selection menu
echo
info "What would you like to set up?"

PS3="Enter a number: "
select opt in "hyprland + waybar" "nvim" "tmux" "all of the above" "quit"; do
    case $REPLY in
        1) setup_hyprland; break ;;
        2) link_config "nvim"; break ;;
        3)
            link_home "tmux/.tmux.conf"
            link_home "tmux/.tmux.conf.local"
            break
            ;;
        4) setup_all; break ;;
        5) info "exiting"; exit 0 ;;
        *) warn "invalid option: $REPLY" ;;
    esac
done

info "setup complete"
