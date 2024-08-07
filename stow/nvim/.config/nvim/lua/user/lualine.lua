local M = {
  "nvim-lualine/lualine.nvim",
  -- dependencies = {
  --   "AndreM222/copilot-lualine",
  -- },
}

function M.config()
  -- local icons = require "user.icons"
  -- local diff = {
  --   "diff",
  --   colored = false,
  --   symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  -- }

  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn" },
    colored = true, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
  }

  require("lualine").setup {
    options = {
      theme = "auto", --neovim
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },
    },
    sections = {
      -- lualine_a = { {"branch", icon =""} },
      -- lualine_b = { diff },
      -- lualine_c = { "diagnostics" },
      -- lualine_x = { copilot },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "progress" },
      -- lualine_a = { "mode" },
      lualine_a = {},
      lualine_b = { "branch" },
      lualine_c = { diagnostics },
      -- lualine_x = { diff, "copilot", filetype },
      -- lualine_x = { language_server },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
