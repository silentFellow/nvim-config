local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "neovim/nvim-lspconfig",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy"
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>o", "<cmd>Navbuddy<cr>", desc = "Nav" },
  }

  local navbuddy = require "nvim-navbuddy"

  navbuddy.setup {
    window = {
      border = "rounded",
    },
    icons = require("utils.icons").kind,
    lsp = { auto_attach = true },
  }
end

return M
