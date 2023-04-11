local colorscheme = "kanagawa"
-- local colorscheme = "catppuccin"
-- local colorscheme = "darkplus"
-- local colorscheme = "ondark"
-- local colorscheme = "onedarker"
-- local colorscheme = "material"
-- local colorscheme = "tokyonight"
-- local colorscheme = "gruvbox"
-- local colorscheme = "nightfox"

-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
	transparent_background = true,
	term_colors = true,

  flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
	},
	color_overrides = {
		latte = {
			base = "#E1EEF5",
		},
		mocha = {
			base = "#000000",
		},
	},
	highlight_overrides = {
		latte = function(latte)
			return {
				NvimTreeNormal = { bg = "#D1E5F0" },
			}
		end,
		mocha = function(mocha)
			return {
				NvimTreeNormal = { bg = mocha.none },
				CmpBorder = { fg = mocha.surface2 },
			}
		end,
	},
	integrations = {
		treesitter = true,
		nvimtree = true,
		dap = {
			enabled = true,
			enable_ui = true,
		},
		lsp_saga = true,
		neogit = true,
	},
})

require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = true,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    -- colors = {                   -- add/modify theme and palette colors
    --   palette = {},
    --   theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    -- },
    overrides = function(_colors) -- add/modify highlights
      return {}
    end,
    -- theme = { default = "true"}           -- Load "default" theme or the experimental "light" theme
    theme = { dark = "wave"},               -- Load "wave" theme when 'background' option is not set
    -- background = {               -- map the value of 'background' option to a theme
    --   dark = "wave",           -- try "dragon" !
    --   light = "lotus"
    -- },
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
