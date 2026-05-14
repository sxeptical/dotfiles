# Dotfiles

Managed with git. Includes configs for:
- Hyprland
- Neovim (LazyVim)
- Waybar

## Structure

```
dotfiles/
├── hypr/      # Hyprland config
├── nvim/      # Neovim config (LazyVim)
└── waybar/    # Waybar config
```

## Setup

### Automatic

```bash
git clone https://github.com/sxeptical/dotfiles.git ~/dotfiles
~/dotfiles/setup.sh
```

The script is idempotent — safe to re-run. Existing configs are backed up before linking.

### Manual

```bash
git clone https://github.com/sxeptical/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/hypr ~/.config/hypr
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/waybar ~/.config/waybar
```
