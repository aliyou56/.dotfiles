local M = {
  {
    "rebelot/kanagawa.nvim",
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- lazy = false,
    config = function()
      require('kanagawa').setup {
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,         -- do not set background color
        dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        theme = "wave",              -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
          dark = "wave",           -- try "dragon" !
          light = "lotus"
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- Explorer
            SnacksExplorerNormal     = { fg = theme.ui.fg,      bg = "none" },
            SnacksExplorerWinBar     = { fg = theme.ui.fg_dim,  bg = "none" },
            SnacksExplorerTitle      = { fg = theme.ui.special, bold = true },
            SnacksExplorerDir        = { fg = theme.ui.fg_dim },
            SnacksExplorerGitAdded   = { fg = theme.vcs.added },
            SnacksExplorerGitChanged = { fg = theme.vcs.changed },
            SnacksExplorerGitRemoved = { fg = theme.vcs.removed },

            -- Picker
            SnacksPickerBorder  = { fg = theme.ui.border },
            SnacksPickerPrompt  = { fg = theme.ui.special },
            SnacksPickerMatch   = { fg = theme.diag.warning, bold = true },

            -- Notifier
            SnacksNotifierInfo  = { fg = theme.diag.info },
            SnacksNotifierWarn  = { fg = theme.diag.warning },
            SnacksNotifierError = { fg = theme.diag.error },

            -- General
            SnacksNormal      = { bg = "none" },
            SnacksBackdrop    = { bg = "none" },
            SnacksIndentScope = { fg = theme.ui.special },
          }
        end,
      }
      -- vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    "catppuccin/nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
        term_colors = true,

        flavour = "mocha", -- latte, frappe, macchiato, mocha
        integrations = {
          snacks = {
            enabled = true,
            indent_scope_color = "lavender",
          },
          lsp_saga = true,
          gitsigns = true,
          -- mini = {
          --     enabled = true,
          --     indentscope_color = "",
          -- },
          -- dap = {
          --   enabled = true,
          --   enable_ui = true,
          -- },
        },
      }
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "folke/tokyonight.nvim",
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- lazy = false,
    config = function ()
      require("tokyonight").setup {
        style = "moon", -- or "night", "storm", "day"
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "transparent", -- "dark"
          floats = "transparent" -- "dark"
        },
        plugins = { auto = true },
      }
      -- vim.cmd.colorscheme "tokyonight"
    end
  },

  {
    "EdenEast/nightfox.nvim",
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- lazy = false,
    config = function ()
      require('nightfox').setup {
        options = {
          transparent = true,
          dim_inactive = false,
          terminal_colors = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            functions = "bold",
          }
        }
      }
      -- vim.cmd.colorscheme "nightfox"
    end
  },
  {
    "gruvbox-community/gruvbox",
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- lazy = false,
    config = function ()
      -- vim.cmd.colorscheme "gruvbox"
    end
  },
}

function M.config()
end

return M
