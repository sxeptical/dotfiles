return {
  -- Available colorschemes (only one is active at a time)
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  -- Default colorscheme on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
    priority = 1000,
  },
}
