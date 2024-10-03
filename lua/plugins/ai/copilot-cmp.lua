local M = {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = {
    "zbirenbaum/copilot.lua"
  }
}

function M.config()
  require("copilot_cmp").setup()
end

return M
