local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 999,
}

function catppuccin.config()
  require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    default_integrations = true,
    integrations = {
      barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
      cmp = true,
      fidget = true,
      flash = true,
      gitsigns = true,
      harpoon = true,
      indent_blankline = { enabled = true, scope_color = "text", colored_indent_levels = false },
      noice = true,
      nvimtree = true,
      treesitter = true,
      notify = true,
      mason = true,
      mini = {
        enabled = true,
        indentscope_color = "red",
      },
      telescope = {
        enabled = true,
      },
      illuminate = {
        enabled = true,
        lsp = false
      },
      ufo = true,
      which_key = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },

    custom_highlights = function (colors)
      return {
        LineNr = { fg = colors.rosewater },
        LineNrAbove = { fg = colors.overlay1 },
        LineNrBelow = {  fg = colors.overlay1 },
      }
    end
  })

  -- setup must be called before loading
  vim.cmd.colorscheme "catppuccin"

  -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='blue' })
  -- vim.api.nvim_set_hl(0, 'LineNr', { fg='yellow' })
  -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='magenta' })
end

local cyberdream = {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  opts = function(_, opts)
    opts.transparent = true
    opts.italic_comments = true
    opts.borderless_telescope = false
  end,
}

return { catppuccin, cyberdream }
