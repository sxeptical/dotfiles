-- View and edit PDFs, Word, Excel and PowerPoint files (pages in kitty, text elsewhere).
-- Uses the local checkout when it exists (so edits show up immediately), otherwise installs from GitHub.
local dev = vim.fn.expand("~/Documents/code/docview.nvim")

return {
  "sxeptical/docview.nvim",
  dir = vim.uv.fs_stat(dev) and dev or nil,
  lazy = false,
  dependencies = { "folke/snacks.nvim" },
  opts = {},
}
