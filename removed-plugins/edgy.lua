local M = {
  "folke/edgy.nvim",
  opts = function(_, opts)
    opts.right = opts.right or {}
    table.insert(opts.right, {
      ft = "copilot-chat",
      title = "Copilot Chat",
      size = { width = 60 },
    })
  end
}

function M.config()
  require("edgy").setup({
    right = {
      {
        ft = "copilot-chat",
        title = "Copilot Chat",
        size = { width = 60 },
      }
    },
    animate = {
      enabled = false
    }
  })
end

return M
