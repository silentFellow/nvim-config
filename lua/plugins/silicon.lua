local M = {
  "michaelrommel/nvim-silicon",
  event = "VeryLazy",
  cmd = "Silicon"
}

function M.init()
  vim.keymap.set("v", "<leader>sc", ":Silicon<CR>", { desc = "Snapshot code" } )
end

function M.config()
  local fileNameWithExtension = function() return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t") end
  local fileNameWithoutExtension = function() return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t:r") end



  require "nvim-silicon".setup {
    output = function ()
      -- Function to create directory if it doesn't exist
      local create_directory = function(path)
        if vim.fn.isdirectory(path) == 0 then
          vim.fn.mkdir(path, "p")
        end
      end

      -- Create the screen_shots directory if it doesn't exist
      create_directory("./screen_shots")
      return "./screen_shots/" .. fileNameWithoutExtension() .. ".png"
    end,

    font = "JetBrainsMono Nerd Font Mono=21.4",
    theme = "Dracula",
    background = "#94e2d5",
    window_title = fileNameWithExtension(),
    tab_width = 2,

    pad_vert = 80,
    pad_horiz = 50,
  }
end

return M
