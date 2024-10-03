local M = {
  "folke/which-key.nvim",
}

M.keys = {
  { "<leader>;", "<cmd>tabnew | terminal<CR>", desc = "Term" },
  { "<leader>T", group = "Treesitter" },
  { "<leader>a", group = "Tab" },
  { "<leader>aN", "<cmd>tabnew %<cr>", desc = "New Tab" },
  { "<leader>ah", "<cmd>-tabmove<cr>", desc = "Move Left" },
  { "<leader>al", "<cmd>+tabmove<cr>", desc = "Move Right" },
  { "<leader>an", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
  { "<leader>ao", "<cmd>tabonly<cr>", desc = "Only" },
  { "<leader>b", group = "Buffers" },
  { "<leader>d", group = "Debug" },
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Git" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
  { "<leader>l", group = "LSP" },
  { "<leader>p", group = "Plugins" },
  { "q", "<cmd>confirm q<CR>", desc = "Quit" },
  { "<leader>t", group = "Test" },
  { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
}

function M.config()
  local which_key = require "which-key"
  which_key.setup {
    -- n = true, -- Normal mode
    -- i = true, -- Insert mode
    -- x = true, -- Visual mode
    -- s = true, -- Select mode
    -- o = true, -- Operator pending mode
    -- t = true, -- Terminal mode
    -- c = true, -- Command mode
    preset = "helix",
    delay = 450,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }
end

return M
