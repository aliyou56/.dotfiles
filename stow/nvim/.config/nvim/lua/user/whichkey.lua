local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local which_key = require "which-key"
  which_key.setup {
    preset = "helix", -- classic, modern
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
      },
    },
    win = {
      border = "rounded",
      no_overlap = false,
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
    },
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local wk = require "which-key"
  wk.add {
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
  --   { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
    {
      "<leader>;",
      "<cmd>tabnew | terminal<CR>",
      desc = "Term",
      icon = { icon = " ", color = "green", },
    },
    -- { "<leader>w", "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>", desc = "Wrap", hidden = true, },
    -- { "<leader>v", "<cmd>vsplit<CR>", desc = "Split", hidden = true },

    { "<leader>b", group = "Buffers" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "LSP", icon = { icon = " ", color = "blue", } },
    { "<leader>p", group = "Plugins", icon = { icon = " ", color = "azure", } },
    { "<leader>t", group = "Test" },
    { "<leader>T", group = "Treesitter" },

  --   { "<leader>a", group = "Tab" },
  --   { "<leader>aN", "<cmd>tabnew %<cr>", desc = "New Tab" },
  --   { "<leader>ah", "<cmd>-tabmove<cr>", desc = "Move Left" },
  --   { "<leader>al", "<cmd>+tabmove<cr>", desc = "Move Right" },
  --   { "<leader>an", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
  --   { "<leader>ao", "<cmd>tabonly<cr>", desc = "Only" },
  }
end

return M
