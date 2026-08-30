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
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
  },

  -- Default colorscheme on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
    priority = 1000,
  },
}
