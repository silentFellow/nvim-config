local M = {
  "rmagatti/auto-session",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}

function M.config()
  require("auto-session").setup {
    log_level = 'error',
    auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

    session_lens = {
      -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
      load_on_setup = true,
      theme_conf = { border = true },
      previewer = false,
      buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
    },

    vim.keymap.set("n", ";s", require("auto-session.session-lens").search_session, { noremap = true }),
  }
end

return M
