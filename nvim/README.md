# Neovim Configuration

A [LazyVim](https://github.com/LazyVim/LazyVim) based Neovim configuration with custom plugins and settings.

## Plugins

### Formatters
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Format code on save
  - JavaScript/TypeScript/JSON: `prettier`
  - Python: `black`

### Editor Enhancements
- **[snacks.nvim](https://github.com/folke/snacks.nvim)** - Dashboard with custom ASCII art
- **[copilot.vim](https://github.com/github/copilot.vim)** - GitHub Copilot AI completions

### Theme
- **[catppuccin](https://github.com/catppuccin/nvim)** - Catppuccin Mocha color scheme

## Keybindings

Keymaps follow LazyVim defaults. See [LazyVim keymaps](https://lazyvim.github.io/keymaps).

## Installation

### Backup existing config
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Clone this repo
```bash
git clone git@github.com:steventok/nvim.git ~/.config/nvim
```

### Install dependencies
```bash
# Install Neovim (0.10+)
# Install a Nerdfont (for icons)
# Install language servers, formatters, etc. as needed
```

### Launch Neovim
```bash
nvim
```

LazyVim will automatically install all plugins on first launch.
