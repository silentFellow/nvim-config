local M = {
  "mawkler/modicator.nvim",
  event = "BufEnter",
}

function M.init()
  -- These are required for Modicator to work
  vim.o.cursorline = false
  vim.o.number = true
  vim.o.termguicolors = true
end

function M.config()
  require("modicator").setup {
    show_warnings = false,
    highlights = {
      defaults = {
        bold = true,
        italic = false,
      },
    },
  }

  vim.api.nvim_create_autocmd({ "Colorscheme" }, {
      callback = function()
        if vim.g.colors_name == "catppuccin" then
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#388bfd", bg = "NONE" })
        end
      end,
  })
end

return M
