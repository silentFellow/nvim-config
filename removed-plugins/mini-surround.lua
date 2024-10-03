local M = {
  'echasnovski/mini.surround',
  version = false,
  event = 'VeryLazy'
}

function M.config()
  require('mini.surround').setup({
    highlight_duration = 100
  })
end

return M
