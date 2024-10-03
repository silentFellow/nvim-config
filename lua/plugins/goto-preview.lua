local M = {
  "rmagatti/goto-preview",
  event = "LspAttach"
}

function M.config()
  require("goto-preview").setup {}

  local mappings = {
    ["gpd"] = { -- Go to definition preview
      cmd = "lua require('goto-preview').goto_preview_definition()",
      desc = "Go to definition preview",
    },
    ["gpt"] = { -- Go to type definition preview
      cmd = "lua require('goto-preview').goto_preview_type_definition()",
      desc = "Go to type definition preview",
    },
    ["gpi"] = { -- Go to implementation preview
      cmd = "lua require('goto-preview').goto_preview_implementation()",
      desc = "Go to implementation preview",
    },
    ["gpD"] = { -- Go to declaration preview
      cmd = "lua require('goto-preview').goto_preview_declaration()",
      desc = "Go to declaration preview",
    },
    ["gP"] = { -- Close all preview windows
      cmd = "lua require('goto-preview').close_all_win()",
      desc = "Close all preview windows",
    },
    ["gpr"] = { -- Go to references preview
      cmd = "lua require('goto-preview').goto_preview_references()",
      desc = "Go to references preview",
    },
  }

  -- Set custom key mappings
  for key, mapping in pairs(mappings) do
    vim.keymap.set("n", key, "<cmd>" .. mapping.cmd .. "<CR>", { desc = mapping.desc, noremap = true })
  end
end

return M
