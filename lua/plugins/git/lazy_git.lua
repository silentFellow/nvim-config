local M = {
  "kdheepak/lazygit.nvim",
  event = "VeryLazy",
  dependencies = {
      "nvim-lua/plenary.nvim",
  },
}

function M.config()
  vim.keymap.set("n", ";g", ":LazyGit<CR>", { desc = "LazyGit" })
end

return M
