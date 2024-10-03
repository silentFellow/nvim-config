local M = {
  "folke/zen-mode.nvim",
  event = "VeryLazy"
}

function M.config()
  vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "toggle zen-mode" })
end

return M
