local M = {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    execution_message = { enabled = false },
    debounce_delay = 3333
  },
}

function M.config()
  require("auto-save").setup({
    -- turn off the execution_message
    execution_message = {
      enabled = false
    },

    -- condition to disable the plugin for harpoon
    condition = function(buf)
      if vim.bo[buf].filetype == "harpoon" then
        return false
      end

      return true
    end
  })
end

return M
