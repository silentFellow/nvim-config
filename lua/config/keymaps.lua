-- setting local variables
local keymap = vim.keymap

local opts = function(desc)
  return {
    noremap = true,
    silent = true,
    desc = desc or "no description"
  }
end

-- macro remap
keymap.set("n", "<leader>q", "q", opts("create macro"))

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts("select all"))

-- indent line
keymap.set("v", "<", "<gv", opts("indent line"))
keymap.set("v", ">", ">gv", opts("indent line"))

-- window nav
keymap.set("n", "<C-h>", "<C-w>h", opts("window left"))
keymap.set("n", "<C-l>", "<c-w>l", opts("window right"))
keymap.set("n", "<C-j>", "<c-w>j", opts("window down"))
keymap.set("n", "<C-k>", "<c-w>k", opts("window up"))

-- show full path
keymap.set("n", "<leader>pa", ":echo expand('%:p')<CR>", opts("full path"))

-- buffer navigation
keymap.set("n", "<leader>bn", "bn", opts("next buffer"))
keymap.set("n", "<leader>bp", "bp", opts("previous buffer"))

-- nvim-general
keymap.set("i", "<C-b>", "<ESC>^i", opts("beginning of line"))
keymap.set("i", "<C-e>", "<End>", opts("end of line"))
keymap.set("i", "<C-h>", "<Left>", opts("move left"))
keymap.set("i", "<C-l>", "<Right>", opts("move right"))
keymap.set("i", "<C-j>", "<Down>", opts("move down"))
keymap.set("i", "<C-k>", "<Up>", opts("move up"))

keymap.set("n", "<Esc>", "<cmd> noh <CR>", opts("clear highlights"))
keymap.set("n", "<C-s>", "<cmd> w <CR>", opts("save file"))
keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", opts("copy whole file"))
keymap.set("n", "<leader>n>", "<cmd> set nu! <CR>", opts("toggle line number"))
keymap.set("n", "<leader>rn", "<cmd> set rnu! <CR>", opts("toggle relative number"))

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
keymap.set("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts("move down"))
keymap.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts("move up"))
-- keymap.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts("move up"))
-- keymap.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts("move down"))
keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts("new buffer"))

keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), opts("escape terminal mode"))

keymap.set("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts("move up"))
keymap.set("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts("move down"))

keymap.set("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts("move down"))
keymap.set("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts("move up"))

-- make (copy replaced text == false)
keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts("dont copy replaced text"))

-- nvim-comment
keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, opts("toggle comment"))

keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts("toggle comment"))

-- nvim-blankline
keymap.set("n", "<leader>cc", function()
  local ok, start = require("indent_blankline.utils").get_current_context(
    vim.g.indent_blankline_context_patterns,
    vim.g.indent_blankline_use_treesitter_scope
  )

  if ok then
    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
    vim.cmd [[normal! _]]
  end
end, opts("jump to current context"))

-- for next or previous similar text and to center it
keymap.set("n", "n", "nzz", opts("Move to next match and center screen"))
keymap.set("n", "N", "Nzz", opts("Move to previous match and center screen"))
keymap.set("n", "*", "*zz", opts("Search word under cursor forward and center screen"))
keymap.set("n", "#", "#zz", opts("Search word under cursor backward and center screen"))
keymap.set("n", "g*", "g*zz", opts("Partial search word under cursor forward and center screen"))
keymap.set("n", "g#", "g#zz", opts("Partial search word under cursor backward and center screen"))

-- Mouse Popups
keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>", opts("Open mouse menu"))
keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>", opts("Open mouse menu"))

-- More Good
keymap.set({ "n", "o", "x" }, "<s-h>", "^", opts("Move to the first non-blank character"))
keymap.set({ "n", "o", "x" }, "<s-l>", "g_", opts("Move to the last non-blank character"))

-- Tailwind Browsable
keymap.set({ "n", "x" }, "j", "gj", opts("Move down with line wrapping"))
keymap.set({ "n", "x" }, "k", "gk", opts("Move up with line wrapping"))

-- Toggle Wrap
keymap.set("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts("Toggle line wrapping"))
