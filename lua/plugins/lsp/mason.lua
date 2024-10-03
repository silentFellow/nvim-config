local M = {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
}

function M.config()
  local mason = require "mason"
  local mason_lspconfig = require "mason-lspconfig"
  local mason_tool_installer = require "mason-tool-installer"

  -- enable mason and configure icons
  mason.setup {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  }

  mason_lspconfig.setup {
    -- list of servers for mason to install
    ensure_installed = {
      "cssls",
      "dockerls",
      "emmet_ls",
      "eslint",
      "gopls",
      "html",
      "jdtls",
      "jsonls",
      "lua_ls",
      "marksman",
      "jedi_language_server",
      "tailwindcss",
      "ts_ls",
      "yamlls",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
  }

  mason_tool_installer.setup {
    ensure_installed = {
      -- lua
      "stylua", -- formatter

      -- python
      "isort", -- formatter
      "black", -- formatter
      "pylint", -- linter
      "mypy",
      "ruff-lsp", -- disgnostic
      "pyright", -- lsp

      -- go
      "gofumpt",
      "goimports-reviser",
      "golines",
      "golangci-lint",

      -- js
      "prettierd",
      "eslint_d",
      "eslint-lsp", -- disgnostic

      -- java
      "checkstyle",
      "google-java-format",
    },
  }
end

return M
