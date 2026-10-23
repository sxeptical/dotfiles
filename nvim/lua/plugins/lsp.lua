return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- https://github.com/olrtg/emmet-language-server
      -- Installed automatically via Mason (npm: @olrtg/emmet-language-server).
      emmet_language_server = {
        -- Trim this list if you only want emmet in a few filetypes.
        -- Defaults (from nvim-lspconfig): astro, css, eruby, html, htmlangular,
        -- htmldjango, javascriptreact, less, sass, scss, svelte, typescriptreact,
        -- vue
        -- filetypes = { "html", "css", "scss", "less", "javascriptreact", "typescriptreact" },
        init_options = {
          -- Emmet config options: https://github.com/emmetio/emmet/blob/master/src/config.ts
          showAbbreviationSuggestions = true,
          showExpandedAbbreviation = "always",
          -- Custom snippets, e.g.:
          -- snippets = { html = { ["!"] = "!!!+html:bei^body:bt[lang=${lang}]" } },
        },
      },
    },
  },
}
