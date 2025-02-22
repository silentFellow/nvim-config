local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  local lualine = require("lualine")
  local lazy_status = require("lazy.status") -- to configure lazy pending updates count

  -- configure lualine with modified theme
  lualine.setup({
    options = {
      -- theme = "catppuccin",
      theme = "auto"
    },
    sections = {
      lualine_x = {
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
        },
        { "encoding" },
        { "fileformat" },
        { "filetype" },
      },
    },
  })
end

return M
