local M = {
  "folke/trouble.nvim",
  event = "LspAttach",
  cmd = "Trouble",
  opts = {},
}

M.keys = {
  {
    "<leader>X",
    "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Diagnostics (Trouble)",
  },
  {
    "<leader>x",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    desc = "Buffer Diagnostics (Trouble)",
  }
}

function M.config()
  require("trouble").setup {}
end

return M
