local M = {
  "LunarVim/bigfile.nvim",
  event = "BufReadPre"
}

M.opts = {
  fileSize = 3
}

function M.config()
  require "bigfile". setup {}
end

return M
