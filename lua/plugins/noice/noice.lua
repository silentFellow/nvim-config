local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}

function M.opts(_, opts)
  opts = opts or {}  -- Ensure opts is not nil
  opts.routes = opts.routes or {}  -- Ensure opts.routes is not nil
  table.insert(opts.routes, {
    filter = {
      event = "notify",
      find = "No information available",
    },
    opts = { skip = true },
  })
  local focused = true
  vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
      focused = true
    end,
  })
  vim.api.nvim_create_autocmd("FocusLost", {
    callback = function()
      focused = false
    end,
  })
  table.insert(opts.routes, 1, {
    filter = {
      cond = function()
        return not focused
      end,
    },
    view = "notify_send",
    opts = { stop = false },
  })

  opts.commands = {
    all = {
      -- options for the message history that you get with `:Noice`
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {},
    },
  }

  opts.presets = opts.presets or {}  -- Ensure opts.presets is not nil
  opts.presets.lsp_doc_border = true
end

function M.config()
  local opts = {}  -- Create opts table
  M.opts(nil, opts)  -- Call M.opts function with opts parameter

  require("noice").setup({
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
  })

  vim.keymap.set("n", "<leader>nq", ":Noice dismiss<CR>", { desc = "dismiss all noice messages" })
  vim.keymap.set("n", "<leader>nt", ":Noice telescope<CR>", { desc = "open all noice messages in telescope" })
end

return M
