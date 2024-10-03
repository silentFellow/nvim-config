local M = {
  "m4xshen/hardtime.nvim",
  event = "BufEnter",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {}
}

function M.config()
  require "hardtime".setup {}
end

return M
