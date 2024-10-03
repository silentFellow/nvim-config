local M = {
  "chrisgrieser/nvim-scissors",
  dependencies = "nvim-telescope/telescope.nvim", -- optional
  opts = {
      --[[ snippetDir = vim.fn.stdpath("config") .. "lua/plugins/lsp/scissors/snippets" ]] -- not working check it
  }
}

function M.config()
  require("scissors").setup({
    -- telescope = {
    --   alsoSearchSnippetBody = true
    -- },
    --
    -- jsonFormatter = "jsonls"
  })


  vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end, { desc = "edit snippets" })

  vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end, { desc = "add snippets" })
end

return M
