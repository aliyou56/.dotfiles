local M = {
  "nvim-lualine/lualine.nvim",
  -- dependencies = {
  --   "AndreM222/copilot-lualine",
  -- },
}

function M.config()
  local icons = require "user.icons"

  local function lsp_server_names()
    local lsp_clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
    local server_names = {}
    for _, client in ipairs(lsp_clients) do
      table.insert(server_names, client.name)
    end
    return table.concat(server_names, ", ")
  end

  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn" },
    colored = true, -- Displays diagnostics status in color if set to true.
    -- always_visible = true, -- Show diagnostics even if there are none.
  }

  require("lualine").setup {
    options = {
      theme = "auto", --neovim
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", diagnostics },
      lualine_c = { "filename", { lsp_server_names, icon = icons.ui.BoldLineDashedMiddle} },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
