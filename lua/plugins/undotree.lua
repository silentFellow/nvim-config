local M = {
  "mbbill/undotree"
}

function M.config()
  vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { desc = "" })
end

return M
