-- local keyword
local opt = vim.opt

-- tabs and intendation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = false
opt.smartindent = true
opt.pumheight = 12 -- no of popups => snipets

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.fillchars = { eob = " " }

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- appearance
opt.title = true
opt.termguicolors = true
opt.colorcolumn = "99"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.completeopt = "menuone,noinsert,noselect"
opt.scrolloff = 3

-- behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand "~/.nvim/undodir"
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append "-"
opt.iskeyword:append "_"
opt.mouse:append "a"
opt.clipboard:append "unnamedplus"
opt.modifiable = true
opt.splitkeep = "cursor"
opt.confirm = true
opt.timeoutlen = 400
opt.cursorline = true

-- find files
opt.path:append { "**" } -- Finding files - Search down into subfolders
opt.wildignore:append { "*/node_modules/*" }

-- terminal
opt.shell = "zsh"

-- status
opt.laststatus = 3 -- global statusline
opt.showmode = false

-- scrolloff
vim.wo.scrolloff = 2

-- encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Add asterisks in block comments
vim.opt.formatoptions:append { "r" }

if vim.fn.has "nvim-0.8" == 1 then
  vim.opt.cmdheight = 0
end
