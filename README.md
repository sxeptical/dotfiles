# Dotfiles

My configs for neovim, tmux and hyprland

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
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/waybar ~/.config/waybar
```
