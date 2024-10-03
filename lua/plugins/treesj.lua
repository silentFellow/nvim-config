local M = {
  "Wansmer/treesj",
  event = "VeryLazy"
}

function M.config()
  require "treesj".setup {
    use_default_keymaps = false,
    max_join_length = 999,
  }
end

M.keys = {
  {
    "<leader>s",
    "<CMD>TSJToggle<CR>",
    desc = "Toggle Treesitter join",
  }
}

M.cmd = { 'TSJTogle', 'TSJSplit', 'TSJJoin' }

M.opts = { use_default_keymaps = false }

return M
