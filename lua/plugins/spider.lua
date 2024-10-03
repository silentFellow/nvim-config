local M = {
  "chrisgrieser/nvim-spider",
  event = "VeryLazy",
}

function M.config()
  vim.keymap.set(
    { "n", "o", "x" },
    "w",
    "<cmd>lua require('spider').motion('w')<CR>",
    { desc = "Spider-w" }
  )
  vim.keymap.set(
    { "n", "o", "x" },
    "e",
    "<cmd>lua require('spider').motion('e')<CR>",
    { desc = "Spider-e" }
  )
  vim.keymap.set(
    { "n", "o", "x" },
    "b",
    "<cmd>lua require('spider').motion('b')<CR>",
    { desc = "Spider-b" }
  )

  vim.keymap.set(
    { "i" },
    "<C-f>",
    "<Esc>l<cmd>lua require('spider').motion('w')<CR>i",
    { desc = "Spider-w" }
  )
  vim.keymap.set(
    { "i" },
    "<C-b>",
    "<Esc><cmd>lua require('spider').motion('b')<CR>i",
    { desc = "Spider-b" }
  )

  -- for custom patterns refer the page
end

return M
