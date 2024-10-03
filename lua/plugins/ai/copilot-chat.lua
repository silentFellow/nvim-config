local M = {
  "CopilotC-Nvim/CopilotChat.nvim",
  event = "VeryLazy",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  opts = {
    debug = true, -- Enable debugging
  }
}

function M.config()
  require("CopilotChat").setup {
    show_help = false,
    -- auto_insert_mode = true,
    window = {
      layout = "float",
      height = 0.9,
      width = 0.9,
      -- border = "double"
    },
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = true
        vim.opt_local.number = true
      end,
    })
  }

  local keymap = vim.keymap

  keymap.set("n", "<leader>c", "<cmd>lua require('CopilotChat').toggle()<CR>")
  keymap.set("v", "<leader>cd", ":CopilotChatDocs<CR>")
  keymap.set("v", "<leader>ce", ":CopilotChatExplain<CR>")
  keymap.set("v", "<leader>cr", ":CopilotChatReview<CR>")
  keymap.set("v", "<leader>cf", ":CopilotChatFix<CR>")
  keymap.set("v", "<leader>co", ":CopilotChatOptimize<CR>")
end

return M
