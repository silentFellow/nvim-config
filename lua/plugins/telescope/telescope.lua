local M = {
  "nvim-telescope/telescope.nvim",
  tags = "0.1.8",
  branch = '0.1.x',
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = true,
    },
    { 'nvim-lua/plenary.nvim' }
  },
}

function M.config()

  local wk = require "which-key"

  wk.add {
    { ";a", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <cr>", desc = "Find hidden files" },
    { ";b", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { ";f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { ";gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { ";gc", "<cmd>Telescope git_commits<cr>", desc = "git commits" },
    { ";gs", "<cmd>Telescope git_status<cr>", desc = "git status" },
    { ";h", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { ";k", "<cmd>Telescope keymaps<cr>", desc = "keymaps Search" },
    { ";l", "<cmd>Telescope resume<cr>", desc = "Last Search" },
    { ";o", "<cmd>Telescope oldfiles<cr>", desc = "Old/Recent File" },
    { ";p", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
    { ";t", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
    { ";z", "<cmd><cmd> Telescope current_buffer_fuzzy_find <CR>", desc = "Find text in current buffer" },
    { "<leader>bb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
  }

  local icons = require "utils.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    -- pickers = {
    --   live_grep = {
    --     theme = "dropdown",
    --   },
    --
    --   grep_string = {
    --     theme = "dropdown",
    --   },
    --
    --   find_files = {
    --     theme = "dropdown",
    --     previewer = false,
    --   },
    --
    --   buffers = {
    --     theme = "dropdown",
    --     previewer = false,
    --     initial_mode = "normal",
    --     mappings = {
    --       i = {
    --         ["<C-d>"] = actions.delete_buffer,
    --       },
    --       n = {
    --         ["dd"] = actions.delete_buffer,
    --       },
    --     },
    --   },
    --
    --   planets = {
    --     show_pluto = true,
    --     show_moon = true,
    --   },
    --
    --   colorscheme = {
    --     enable_preview = true,
    --   },
    --
    --   lsp_references = {
    --     theme = "dropdown",
    --     initial_mode = "normal",
    --   },
    --
    --   lsp_definitions = {
    --     theme = "dropdown",
    --     initial_mode = "normal",
    --   },
    --
    --   lsp_declarations = {
    --     theme = "dropdown",
    --     initial_mode = "normal",
    --   },
    --
    --   lsp_implementations = {
    --     theme = "dropdown",
    --     initial_mode = "normal",
    --   },
    -- },

    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
