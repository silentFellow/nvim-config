-- imports spec func, which converts plugings to modular
require "utils.spec"

-- plugins
spec "plugins.whichkey"
spec "plugins.colorscheme"
spec "plugins.devicons"
spec "plugins.treesitter"
spec "plugins.schemaStore"
spec "plugins.comments"
spec "plugins.harpoon"
spec "plugins.lualine"
spec "plugins.barbecue"
spec "plugins.tabby"
spec "plugins.neoscroll"
spec "plugins.illuminate"
spec "plugins.ufo"
spec "plugins.autopairs"
spec "plugins.toggleterm"
spec "plugins.surround"
spec "plugins.fidget"
spec "plugins.dressing"
spec "plugins.navbuddy"
spec "plugins.modicator"
spec "plugins.autosave"
spec "plugins.treesj"
spec "plugins.better-escape"
spec "plugins.undotree"
spec "plugins.flash"
spec "plugins.tmux-navigator"
spec "plugins.ts-autotag"
spec "plugins.goto-preview"
spec "plugins.numb"
spec "plugins.spider"
spec "plugins.gomove"
spec "plugins.silicon"
spec "plugins.marks"
spec "plugins.stay-centered"
spec "plugins.alpha"
spec "plugins.guess-indent" -- tabswtidth management
spec "plugins.rainbow-delimiters"
spec "plugins.auto-session"
spec "plugins.indent-blankline"
spec "plugins.bigfile"

-- markdown plugins
spec "plugins.markdown.peek"

-- noice plugins
spec "plugins.noice.noice"
spec "plugins.noice.notify"

-- git plugins
spec "plugins.git.gitsigns"
spec "plugins.git.lazy_git"
spec "plugins.git.neogit"

-- mini plugins
spec "plugins.mini.mini-animate"
spec "plugins.mini.mini-indentscope"
spec "plugins.mini.mini-trailspace"
spec "plugins.mini.mini-ai"
spec "plugins.mini.mini-files"

-- lsp plugins
spec "plugins.lsp.mason"
spec "plugins.lsp.lspconfig"
spec "plugins.lsp.nvim-cmp"
-- spec "plugins.lsp.none-ls"
spec "plugins.lsp.formatting"
spec "plugins.lsp.linting"
spec "plugins.lsp.scissors"
spec "plugins.lsp.golang.gopher"
spec "plugins.lsp.trouble"

-- ai
-- spec "plugins.ai.codium"
spec "plugins.ai.copilot"
spec "plugins.ai.copilot-cmp"
spec "plugins.ai.copilot-chat"

-- zen-mode
spec "plugins.zen-mode.twilight"
spec "plugins.zen-mode.zen-mode"

-- telescope
spec "plugins.telescope.telescope"
spec "plugins.telescope.telescope-import"

-- good-practice
spec "plugins.good-practice.hardtime"

-- config imports
require "config.globals"
require "config.autocmds"
require "config.options"
require "config.keymaps"
require "config.lazy"
