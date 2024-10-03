local m = {
  "nvim-treesitter/nvim-treesitter",
  event = { "bufreadpost", "bufnewfile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag"
  },
}

function m.config()
  require "nvim-treesitter.configs".setup {
    ensure_installed = {
      "bash",
      "c",
      "comment",
      "css",
      "dockerfile",
      "git_config",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "rust",
      "ssh_config",
      "toml",
      "tsx",
      "typescript",
      "vimdoc",
      "yaml"
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},

    highlight = {
      enable = true,
      use_langtree = true,
      additional_vim_regex_highlighting = false
    },

    indent = {
      enable = true,
      disable = { "tsx" }
    }
  }
end

return m
