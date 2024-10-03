local m = {
  'piersolenski/telescope-import.nvim',
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      ";i",
      ":Telescope import<cr>",
      desc = "Imports"
    }
  }
}

function m.config()
  require("telescope").setup({
    extensions = {
      import = {
        custom_languages = {
          {
            regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
            filetypes = { "typescript", "typescriptreact", "javascript", "react" },
            extensions = { "js", "ts" },
          },
          {
            regex = [[^import\s+(?:\(\s*)?["']?([\w./]+)["']?\s*(?:\))?]],
            filetypes = { "go" },
            extensions = { "go" },
          },
          {
            regex = [[^import\s+\(([\s\S]+?)\)]],
            filetypes = { "go" },
            extensions = { "go" },
          },
        },
      },
    },
  })
  require("telescope").load_extension("import")
end

return m
