local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local harpoon = require("harpoon")
  harpoon:setup({
    settings = {
      save_on_toggle = true,
    }
  })

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<s-m>", function ()
    harpoon:list():add()
    vim.notify "󱡅  marked file"
  end, opts)

  keymap("n", "<TAB>", function () harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  -- keymap("n", "!", function() harpoon:list():select(1) end)
  -- keymap("n", "@", function() harpoon:list():select(2) end)
  -- keymap("n", "#", function() harpoon:list():select(3) end)
  -- keymap("n", "$", function() harpoon:list():select(4) end)
  -- keymap("n", "%", function() harpoon:list():select(5) end)
  -- keymap("n", "^", function() harpoon:list():select(6) end)

  keymap("n", "<C-p>", function() harpoon:list():prev() end)
  keymap("n", "<C-n>", function() harpoon:list():next() end)
end

return M
