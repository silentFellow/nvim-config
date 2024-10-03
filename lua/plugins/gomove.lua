local M = {
  "booperlv/nvim-gomove",
  event = "VeryLazy",
}

function M.config()
  require("gomove").setup({
    map_defaults = false,
  })

  local map = vim.api.nvim_set_keymap

  -- Moving mappings
  map( "n", "<S-down>", "<Plug>GoNSMDown", { noremap = true, silent = true, desc = "Move down (Shift + Down Arrow)" } )
  map( "n", "<S-up>", "<Plug>GoNSMUp", { noremap = true, silent = true, desc = "Move up (Shift + Up Arrow)" } )
  map( "n", "<S-left>", "<Plug>GoNSMLeft", { noremap = true, silent = true, desc = "Move left (Shift + Left Arrow)" } )
  map( "n", "<S-right>", "<Plug>GoNSMRight", { noremap = true, silent = true, desc = "Move right (Shift + Right Arrow)" } )

  map( "v", "<S-down>", "<Plug>GoVSMDown", { noremap = true, silent = true, desc = "Move down in visual mode (Shift + Down Arrow)" } )
  map( "v", "<S-up>", "<Plug>GoVSMUp", { noremap = true, silent = true, desc = "Move up in visual mode (Shift + Up Arrow)" } )
  map( "v", "<S-left>", "<Plug>GoVSMLeft", { noremap = true, silent = true, desc = "Move left in visual mode (Shift + Left Arrow)" } )
  map( "v", "<S-right>", "<Plug>GoVSMRight", { noremap = true, silent = true, desc = "Move right in visual mode (Shift + Right Arrow)" } )

  -- Duplicating mappings
  map( "n", "<S-A-down>", "<Plug>GoNSDDown", { noremap = true, silent = true, desc = "Duplicate down (Shift + Alt + Down Arrow)" } )
  map( "n", "<S-A-up>", "<Plug>GoNSDUp", { noremap = true, silent = true, desc = "Duplicate up (Shift + Alt + Up Arrow)" } )
  map( "n", "<S-A-left>", "<Plug>GoNSDLeft", { noremap = true, silent = true, desc = "Duplicate left (Shift + Alt + Left Arrow)" } )
  map( "n", "<S-A-right>", "<Plug>GoNSDRight", { noremap = true, silent = true, desc = "Duplicate right (Shift + Alt + Right Arrow)" } )

  map( "v", "<S-A-down>", "<Plug>GoVSDDown", { noremap = true, silent = true, desc = "Duplicate down in visual mode (Shift + Alt + Down Arrow)" } )
  map( "v", "<S-A-up>", "<Plug>GoVSDUp", { noremap = true, silent = true, desc = "Duplicate up in visual mode (Shift + Alt + Up Arrow)" } )
  map( "v", "<S-A-left>", "<Plug>GoVSDLeft", { noremap = true, silent = true, desc = "Duplicate left in visual mode (Shift + Alt + Left Arrow)" } )
  map( "v", "<S-A-right>", "<Plug>GoVSDRight", { noremap = true, silent = true, desc = "Duplicate right in visual mode (Shift + Alt + Right Arrow)" } )
end

return M
