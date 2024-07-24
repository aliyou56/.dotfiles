local M = {
  -- "LunarVim/darkplus.nvim",
	"rebelot/kanagawa.nvim",
	-- "catppuccin/nvim",
	-- use("lunarvim/darkplus.nvim")
	-- -- use("LunarVim/onedarker.nvim")
	-- -- use("marko-cerovac/material.nvim")
	-- use("folke/tokyonight.nvim")
	-- -- use("olimorris/onedarkpro.nvim")
	-- use("gruvbox-community/gruvbox")
	-- use("EdenEast/nightfox.nvim")
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()

  -- require("catppuccin").setup({
  --   transparent_background = true,
  --   term_colors = true,
  --
  --   flavour = "mocha", -- latte, frappe, macchiato, mocha
  --   background = { -- :h background
  --     light = "latte",
  --     dark = "mocha",
  --   },
  --   compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
  --   styles = {
  --     comments = {},
  --     conditionals = {},
  --     loops = {},
  --     functions = {},
  --     keywords = {},
  --     strings = {},
  --     variables = {},
  --     numbers = {},
  --     booleans = {},
  --     properties = {},
  --     types = {},
  --   },
  --   color_overrides = {
  --     latte = {
  --       base = "#E1EEF5",
  --     },
  --     mocha = {
  --       base = "#000000",
  --     },
  --   },
  --   highlight_overrides = {
  --     latte = function(latte)
  --       return {
  --         NvimTreeNormal = { bg = "#D1E5F0" },
  --       }
  --     end,
  --     mocha = function(mocha)
  --       return {
  --         NvimTreeNormal = { bg = mocha.none },
  --         CmpBorder = { fg = mocha.surface2 },
  --       }
  --     end,
  --   },
  --   integrations = {
  --     treesitter = true,
  --     nvimtree = true,
  --     dap = {
  --       enabled = true,
  --       enable_ui = true,
  --     },
  --     lsp_saga = true,
  --     neogit = true,
  --   },
  -- })

  require('kanagawa').setup {
      undercurl = true,           -- enable undercurls
      commentStyle = { italic = true },
  --     functionStyle = {},
  --     keywordStyle = { italic = true},
  --     statementStyle = { bold = true },
  --     typeStyle = {},
  --     variablebuiltinStyle = { italic = true},
  --     specialReturn = true,       -- special highlight for the return keyword
  --     specialException = true,    -- special highlight for exception handling keywords
  --     transparent = true,        -- do not set background color
  --     dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
  --     globalStatus = false,       -- adjust window separators highlight for laststatus=3
  --     terminalColors = true,      -- define vim.g.terminal_color_{0,17}
  --     colors = {},
  --     -- theme = { default = "true"}           -- Load "default" theme or the experimental "light" theme
  --     theme = { dark = "wave"},               -- Load "wave" theme when 'background' option is not set
  --     -- background = {               -- map the value of 'background' option to a theme
  --     --   dark = "wave",           -- try "dragon" !
  --     --   light = "lotus"
  --     -- },
  }

  vim.cmd.colorscheme "kanagawa"
  -- vim.cmd.colorscheme "catppuccin"

  -- local colorscheme = "darkplus"
  -- local colorscheme = "ondark"
  -- local colorscheme = "onedarker"
  -- local colorscheme = "material"
  -- local colorscheme = "tokyonight"
  -- local colorscheme = "gruvbox"
  -- local colorscheme = "nightfox"
end

return M
