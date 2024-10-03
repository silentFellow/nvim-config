local M = {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
}

function M.config()
  require("better_escape").setup {
    timeout = vim.o.timeoutlen,
    default_mappings = false,
    mappings = {
      i = {
        j = {
          -- These can all also be functions
          k = "<Esc>",
          j = "<Esc>",
        },
      },
    },
  }
end

return M
