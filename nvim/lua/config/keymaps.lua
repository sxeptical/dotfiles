-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Compile and run the current C++ file in a terminal split.
-- CMake-aware: if the file belongs to a CMake project, build & run via CMake;
-- otherwise fall back to a plain single-file g++ compile.
vim.keymap.set("n", "<leader>rcpp", function()
  vim.cmd("silent! write")
  local file = vim.api.nvim_buf_get_name(0)
  local cmake_root = vim.fs.find({ "CMakeLists.txt" }, { upward = true, path = vim.fs.dirname(file) })[1]

  if cmake_root then
    local root = vim.fs.dirname(cmake_root)
    local build = root .. "/build"
    -- ask which executable to build & run (target name from add_executable)
    vim.ui.input({ prompt = "CMake target: ", default = vim.fn.fnamemodify(file, ":t:r") }, function(target)
      if not target or target == "" then return end
      local cmd = string.format(
        "[ -f '%s/CMakeCache.txt' ] || cmake -S '%s' -B '%s'; cmake --build '%s' --target '%s' && '%s/%s'",
        build, root, build, build, target, build, target
      )
      vim.cmd("split | terminal " .. cmd)
    end)
  else
    local out = vim.fn.fnamemodify(file, ":p:r")
    local cmd = string.format("g++ -Wall '%s' -o '%s' && '%s'", file, out, out)
    vim.cmd("split | terminal " .. cmd)
  end
end, { desc = "Compile & run C++" })
