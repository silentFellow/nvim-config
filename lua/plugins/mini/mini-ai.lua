local M = {
  'echasnovski/mini.ai',
  version = '*',
  event = 'VeryLazy'
}

function M.config()
  require('mini.ai').setup()
end

return M
