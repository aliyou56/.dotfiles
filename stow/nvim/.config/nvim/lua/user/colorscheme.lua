local M = {
  -- "EdenEast/nightfox.nvim",
  -- "gruvbox-community/gruvbox",
  -- "folke/tokyonight.nvim",
  -- "catppuccin/nvim",
  -- "LunarVim/darkplus.nvim",

  -- "LunarVim/onedarker.nvim",
  -- "marko-cerovac/material.nvim",
  -- "olimorris/onedarkpro.nvim",

  "rebelot/kanagawa.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()

  -- require("catppuccin").setup {
  --   transparent_background = true,
  --   term_colors = true,
  --
  --   -- flavour = "mocha", -- latte, frappe, macchiato, mocha
  --   -- background = { -- :h background
  --   --   light = "latte",
  --   --   dark = "mocha",
  --   -- },
  --   integrations = {
  --     gitsigns = true,
  --     treesitter = true,
  --     mini = {
  --         enabled = true,
  --         indentscope_color = "",
  --     },
  --     dap = {
  --       enabled = true,
  --       enable_ui = true,
  --     },
  --     lsp_saga = true,
  --     -- notify = false,
  --     -- neogit = true,
  --     -- cmp = true,
  --     -- nvimtree = true,
  --   },
  -- }

  require('kanagawa').setup {
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
  }

  vim.cmd.colorscheme "kanagawa"
  -- vim.cmd.colorscheme "catppuccin"
  -- vim.cmd.colorscheme "tokyonight"
  -- vim.cmd.colorscheme "nightfox"
  -- vim.cmd.colorscheme "gruvbox"

  -- local colorscheme = "darkplus"
  -- local colorscheme = "ondark"
  -- local colorscheme = "onedarker"
  -- local colorscheme = "material"
  -- local colorscheme = "gruvbox"
  -- local colorscheme = "nightfox"
end

return M
