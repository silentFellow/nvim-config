local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" }, -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  }
}

local has_words_before = function()
  if vim.api.nvim_get_option_value("buftype", {buf=0}) == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

function M.config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
  require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath("config") .. "/snippets" }
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    window = {
      completion = {
        border = {
          { "󱐋", "WarningMsg" },
          { "─", "Comment" },
          { "╮", "Comment" },
          { "│", "Comment" },
          { "╯", "Comment" },
          { "─", "Comment" },
          { "╰", "Comment" },
          { "│", "Comment" },
        },
        scrollbar = false,
        winblend = 0,
      },
      documentation = {
        border = {
          { "󰙎", "DiagnosticHint" },
          { "─", "Comment" },
          { "╮", "Comment" },
          { "│", "Comment" },
          { "╯", "Comment" },
          { "─", "Comment" },
          { "╰", "Comment" },
          { "│", "Comment" },
        },
        scrollbar = false,
        winblend = 0,
      },
    },

    -- experimental = {
    --   ghost_text = true
    -- },
    completion = {
      completeopt = "menu,menuone,preview,noinsert,noselect",
      -- completeopt = "menu,menuone,preview,noinsert,select",
    },
    preselect = "None",

    snippet = { -- configure how nvim-cmp interacts with snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(), -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.expandable() then
          luasnip.expand()
        -- elseif luasnip.expand_or_jumpable() then
        --   luasnip.expand_or_jump()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        elseif cmp.visible() then
          cmp.select_prev_item()
        -- elseif luasnip.jumpable(-1) then
        --   luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },

    -- sources for autocompletion
    sources = cmp.config.sources({
      { name = "copilot" }, -- copilot later replace with codeium
      -- { name = "codeium" }, -- codeium
      { name = "luasnip" }, -- snippets
      { name = "nvim_lsp" },
      { name = "buffer" }, -- text within current buffer
      { name = "path" }, -- file system paths
    }),

    -- configure lspkind for vs-code like pictograms in completion menu
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        ellipsis_char = "...",
        symbol_map = { Copilot = "" }
      }),
    },
  })
end

return M
