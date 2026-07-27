# Dotfiles

My configs for neovim, emacs, tmux, kitty, and Hyprland (hypr, waybar, rofi).

## Structure

```
dotfiles/
├── hyprland/
│   ├── hypr/       # Hyprland + Hyprpaper config, wallpapers
│   ├── waybar/     # Waybar config, styles, scripts
│   └── rofi/       # Rofi launcher themes and config
├── emacs/          # Doom Emacs private config
├── kitty/          # Kitty terminal config
├── nvim/           # Neovim (LazyVim) config
├── tmux/           # Tmux config
└── setup.sh        # Automated setup script
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
ln -s ~/dotfiles/hyprland/hypr ~/.config/hypr
ln -s ~/dotfiles/hyprland/waybar ~/.config/waybar
ln -s ~/dotfiles/hyprland/rofi ~/.config/rofi
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/emacs ~/.config/doom
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

Note: the Emacs folder contains Doom Emacs' private config. Doom expects this at
`~/.config/doom`, so `~/dotfiles/emacs` is symlinked there. After changing
`emacs/init.el` or `emacs/packages.el`, run:

```bash
~/.config/emacs/bin/doom sync
```
