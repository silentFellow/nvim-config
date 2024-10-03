local M = {
  "echasnovski/mini.trailspace",
  event = "BufWritePost"
}

function M.config()
  require("mini.trailspace").setup()

  -- remove whitespace on save
  vim.cmd[[ autocmd BufWritePost * lua MiniTrailspace.trim() ]]
end

return M
