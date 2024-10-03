local M = {
  "olexsmir/gopher.nvim",
  ft = "go"
}

function M.config(_, opts)
  require("gopher").setup(opts)

  local keymap = vim.keymap

  keymap.set("n", "<leader>gsj", ":GoTagAdd json<CR>", { desc = "Add json struct tags" })
  keymap.set("n", "<leader>gsy", ":GoTagAdd yaml<CR>", { desc = "Add yaml struct tags" })
  keymap.set("n", "<leader>ge", ":GoIfErr<CR>", { desc = "Go If Error" })
end

function M.build()
  vim.cmd [[silent! GoInstallDeps]]
end

return M
