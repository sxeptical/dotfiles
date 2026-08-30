return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            -- show hidden files (dotfiles like .git, .env, .DS_Store) by default
            -- mirrors the neo-tree filtered_items solution from
            -- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/353
            -- toggle at runtime with `H` in the explorer
            hidden = true,
          },
        },
      },
    },
  },
}
