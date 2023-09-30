local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded",
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim")  -- Useful lua functions used by lots of plugins

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("scalameta/nvim-metals")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("ray-x/lsp_signature.nvim") -- Show function signature when you type
	use("SmiteshP/nvim-navic")
	-- use "simrat39/symbols-outline.nvim"
	use("b0o/SchemaStore.nvim") -- JSON schemas for Neovim
	use("RRethy/vim-illuminate")
	use { -- TODO
    "j-hui/fidget.nvim",
    tag = 'legacy',
  }
	use("lvimuser/lsp-inlayhints.nvim")
	use("simrat39/rust-tools.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"tzachar/cmp-tabnine",
		 run = "./install.sh",
	})

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Syntax / Treesitter
	use{ "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Marks
	-- use "MattesGroeger/vim-bookmarks"

	-- Fuzzy Finder / Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	-- use "tom-anders/telescope-vim-bookmarks.nvim"

	-- Color
	use("norcalli/nvim-colorizer.lua")
	-- use "NvChad/nvim-colorizer.nvim"
	-- use "nvim-colortils/colortils.nvim"

	-- Colorschemes
	use("rebelot/kanagawa.nvim")
	use("catppuccin/nvim")
	use("lunarvim/darkplus.nvim")
	-- use("LunarVim/onedarker.nvim")
	-- use("marko-cerovac/material.nvim")
	use("folke/tokyonight.nvim")
	-- use("olimorris/onedarkpro.nvim")
	use("gruvbox-community/gruvbox")
	use("EdenEast/nightfox.nvim")

	use("goolord/alpha-nvim") -- Startup
	use("folke/which-key.nvim") -- Keybinding
	use("kevinhwang91/nvim-bqf") -- Quickfix
	use("kylechui/nvim-surround")
	use("akinsho/toggleterm.nvim") -- Terminal
	use("ahmedkhalf/project.nvim") -- Project
	use("kyazdani42/nvim-tree.lua") -- File explorer
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("kyazdani42/nvim-web-devicons") -- Icon
	use("lukas-reineke/indent-blankline.nvim") -- Indent
	use("ThePrimeagen/harpoon")
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup()
		end,
	})
  use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- Utility / Editing Support
	use({ "kevinhwang91/nvim-ufo", 
    requires = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
              {text = {"%s"}, click = "v:lua.ScSa"},
              {text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa"}
            }
          })
        end
      }
    }
  }) -- Folding
  use { 'anuvyklack/fold-preview.nvim',
    requires = 'anuvyklack/keymap-amend.nvim',
    config = function()
        require('fold-preview').setup({
          -- Your configuration goes here.
        })
    end
  }
	use("rcarriga/nvim-notify")
	use("karb94/neoscroll.nvim")
	use("moll/vim-bbye") -- Delete buffer and close files w/o closing windows
	use("windwp/nvim-autopairs")
	use("nacro90/numb.nvim")
	-- use("folke/zen-mode.nvim")
	use({
		"lewis6991/impatient.nvim", -- improve statup time
		config = function()
			require("impatient").enable_profile()
		end,
	})
	use("max397574/better-escape.nvim")
	-- use "lalitmee/browse.nvim"
	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("ruifm/gitlinker.nvim")
	use("sindrets/diffview.nvim") -- single tabpage interface for easily cycling through diff
	-- Comment
	use("numToStr/Comment.nvim")
	use("folke/todo-comments.nvim") -- Highlight, list and search todo comments.
	-- Session
  use({
    "olimorris/persisted.nvim",
    -- config = function()
    --   require("persisted").setup()
    -- end,
  })
	-- Motion
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	})
	use({
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
			})
		end,
	})
	-- Debugging - DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")

	-- Tabline
	-- use "akinsho/bufferline.nvim"
	use({
		"kwkarlwang/bufjump.nvim",
		config = function()
			require("bufjump").setup()
		end,
	})

	-- Testing
	-- use({
	-- 	"nvim-neotest/neotest",
	-- 	requires = {
	-- 		-- "autoinemadec/FixCursorHold.nvim",
	-- 		"stevanmilic/neotest-scala",
	-- 		"nvim-neotest/neotest-python",
	-- 		-- "stevanmilic/neotest-scala",
	-- 	},
	-- })
	-- use "vim-test/vim-test"

	-- Code Runner
	-- use "is0n/jaq-nvim" -- TODO

	-- Markdown
	-- use "iamcco/markdown-review"

	-- "windwp/nvim-spectre",
	-- "mattn/webapi-vim",
	-- use("simrat39/rust-tools.nvim" ),
	-- "olexsmir/gopher.nvim",
	-- "jose-elias-alvarez/typescript.nvim",
	-- "mxsdev/nvim-dap-vscode-js",
	-- use({
	--   "saecki/crates.nvim",
	--   tag = "v0.3.0",
	--   requires = { "nvim-lua/plenary.nvim" },
	--   config = function()
	--     require("crates").setup {
	--       null_ls = {
	--         enabled = true,
	--         name = "crates.nvim",
	--       },
	--     }
	--   end,
	-- } )

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
