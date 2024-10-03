local M = {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
}

function M.config()
  local null_ls = require "null-ls"

  null_ls.setup {
    sources = {
      -- lua
      null_ls.builtins.formatting.stylua,

      -- js
      null_ls.builtins.formatting.prettierd,
      -- null_ls.builtins.formatting.eslint_lsp,

      -- python
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.formatting.black,
      -- null_ls.builtins.diagnostics.ruff_lsp,

      -- go
      -- null_ls.builtins.diagnostics.golangciLint,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.formatting.golines,

      -- java
      -- null_ls.builtins.diagnostics.checkstyle,
      -- null_ls.builtins.formatting.google_java_format,
    },

    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.keymap.set("n", "<S-f>", function()
          vim.lsp.buf.format { bufnr = bufnr }
        end, { desc = "format file" })
      end
    end,
  }
end

return M
