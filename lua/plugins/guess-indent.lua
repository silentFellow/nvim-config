local M = {
  'nmac427/guess-indent.nvim',
  event = "BufRead"
}

function M.config()
  require "guess-indent".setup {}
end

return M
