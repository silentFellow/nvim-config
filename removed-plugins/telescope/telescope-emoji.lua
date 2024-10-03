local m = {
  'xiyaowong/telescope-emoji.nvim',
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>e",
      ":Telescope emoji<cr>",
      desc = "emoji"
    }
  }
}

function m.config(_, opts)
  local telescope = require "telescope"

  telescope.setup(opts)

  telescope.setup {
    extensions = {
      emoji = {
        action = function(emoji)
          vim.api.nvim_put({ emoji.value }, '', true, true)
          print("Emoji inserted: " .. emoji.value)
        end,
      }
    },
  }

end

return m


