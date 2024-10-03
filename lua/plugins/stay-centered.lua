local M = {
  "arnamak/stay-centered.nvim",
  event = "VeryLazy"
}

function M.config()
  require("stay-centered").setup({
    -- Add any configurations here, like skip_filetypes if needed
    -- skip_filetypes = {"lua", "typescript"},
  })
end

return M
