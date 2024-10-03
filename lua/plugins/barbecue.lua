local M = {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  event = "BufRead",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
}

M.opts = {}

function M.config()
  require("barbecue").setup({
    -- theme = "catppuccin",
    theme = "auto"
  })
end

return M
