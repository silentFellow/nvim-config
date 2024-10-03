local m = {
  "jvgrootveld/telescope-zoxide",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    'nvim-lua/popup.nvim'
  },
}

function m.config(_, opts)
  require("telescope").setup(opts)
  require("telescope").load_extension("zoxide")

  vim.keymap.set("n", ";cd", require("telescope").extensions.zoxide.list, { desc = "Zoxide" })
end

return m
