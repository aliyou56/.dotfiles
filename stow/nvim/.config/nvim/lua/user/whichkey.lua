local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	-- triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local m_opts = {
	mode = "n", -- NORMAL mode
	prefix = "m",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
	-- a = { "<cmd>BookmarkAnnotate<cr>", "Annotate" },
	-- c = { "<cmd>BookmarkClear<cr>", "Clear" },
	-- m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
	-- h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
	-- k = { "<cmd>BookmarkPrev<cr>", "Prev" },
	-- s = { "<cmd>BookmarkShowAll<cr>", "Prev" },
	-- s = {
	--   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
	--   "Show",
	-- },
	-- x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
	-- u = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
	--  v = { "<cmd>vsplit<cr>", "vsplit" }

	m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
	["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
	[","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
	-- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
	-- j = { "<cmd>silent BookmarkNext<cr>", "Next" },
	s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
	-- k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
	-- S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
	-- -- s = {
	-- --   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
	-- --   "Show",
	-- -- },
	-- x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
	[";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w<CR>", "Write" },
	["h"] = { "<cmd>nohlsearch<CR>", "No HL" },
	["q"] = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" },
	["/"] = { '<cmd>lua require("Comment.api").toggle_linewise()<CR>', "Comment" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	-- ["u"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
	["v"] = { "<cmd>vsplit<cr>", "vsplit" },

	-- ["f"] = {
	--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	--   "Find files",
	-- },
	-- ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
	-- ["R"] = { '<cmd>lua require("renamer").rename()<cr>', "Rename" },
	["z"] = { "<cmd>ZenMode<cr>", "Zen" },
	["gy"] = "Link",

	-- p = {
	-- 	name = "Packer",
	-- 	c = { "<cmd>PackerCompile<cr>", "Compile" },
	-- 	i = { "<cmd>PackerInstall<cr>", "Install" },
	-- 	s = { "<cmd>PackerSync<cr>", "Sync" },
	-- 	S = { "<cmd>PackerStatus<cr>", "Status" },
	-- 	u = { "<cmd>PackerUpdate<cr>", "Update" },
	-- },

	o = {
		name = "Options",
		w = { ':lua require("user.functions").toggle_option("wrap")<cr>', "Wrap" },
		r = { ':lua require("user.functions").toggle_option("relativenumber")<cr>', "Relative" },
		l = { ':lua require("user.functions").toggle_option("cursorline")<cr>', "Cursorline" },
		s = { ':lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
		t = { ':lua require("user.functions").toggle_tabline()<cr>', "Tabline" },
	},

	-- d = {
	-- 	name = "Debug",
	-- 	b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
	-- 	c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
	-- 	i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
	-- 	o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
	-- 	O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
	-- 	r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
	-- 	l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
	-- 	u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
	-- 	x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
	-- },

	f = {
		name = "Find",
		b = { ":Telescope git_branches<cr>", "Checkout branch" },
		c = { ":Telescope colorscheme<cr>", "Colorscheme" },
		f = {
			":lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
			"Find files",
		},
		t = { ":Telescope live_grep theme=ivy<cr>", "Find Text" },
		h = { ":Telescope help_tags<cr>", "Help" },
		i = { ":lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
		l = { ":Telescope resume<cr>", "Last Search" },
		M = { ":Telescope man_pages<cr>", "Man Pages" },
		r = { ":Telescope oldfiles<cr>", "Recent File" },
		R = { ":Telescope registers<cr>", "Registers" },
		k = { ":Telescope keymaps<cr>", "Keymaps" },
		C = { ":Telescope commands<cr>", "Commands" },
	},

	g = {
		name = "Git",
		g = { ":lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { ":GitBlameToggle<cr>", "Blame" },
		p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			":lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { ":Telescope git_status<cr>", "Open changed file" },
		b = { ":Telescope git_branches<cr>", "Checkout branch" },
		c = { ":Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
	},

	l = {
		name = "LSP",
		a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		f = { ":lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
		-- d = { ":TroubleToggle<cr>", "Diagnostics" },
		w = { ":Lspsaga show_workspace_diagnostics<cr>", "Workspace Diagnostics", },
		b = { ":Lspsaga show_buf_diagnostics<cr>", "buffer Diagnostics" },
		-- F = { ":LspToggleAutoFormat<cr>", "Toggle Autoformat" },
		i = { ":LspInfo<cr>", "Info" },
		I = { ":LspInstallInfo<cr>", "Installer Info" },
		j = { ":lua vim.diagnostic.goto_next({buffer=0})<CR>", "Next Diagnostic", },
		k = { ":lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diagnostic", },
		o = { ":Lspsaga outline<cr>", "Outline" },
		-- q = { ":lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
		-- R = { ":TroubleToggle lsp_references<cr>", "References" },
		s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			":Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		t = { ':lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
		-- u = { ":LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
	},

	-- s = {
	--   name = "Surround",
	--   ["."] = { "<cmd>lua require('nvim-surround').repeat_last()<cr>", "Repeat" },
	--   a = { "<cmd>lua require('nvim-surround').surround_add(true)<cr>", "Add" },
	--   d = { "<cmd>lua require('nvim-surround').surround_delete()<cr>", "Delete" },
	--   r = { "<cmd>lua require('nvim-surround').surround_replace()<cr>", "Replace" },
	--   q = { "<cmd>lua require('nvim-surround').toggle_quotes()<cr>", "Quotes" },
	--   b = { "<cmd>lua require('nvim-surround').toggle_brackets()<cr>", "Brackets" },
	-- },

	S = {
		name = "Session",
		s = { ":SessionSave<cr>", "Save" },
		l = { ":SessionLoadLast<cr>", "Load Last" },
		d = { ":SessionLoad<cr>", "Load Last Dir" },
		f = { ":Telescope persisted<cr>", "Find Session" },
		-- 	-- name = "SnipRun",
		-- 	-- c = { "<cmd>SnipClose<cr>", "Close" },
		-- 	-- f = { "<cmd>%SnipRun<cr>", "Run File" },
		-- 	-- i = { "<cmd>SnipInfo<cr>", "Info" },
		-- 	-- m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
		-- 	-- r = { "<cmd>SnipReset<cr>", "Reset" },
		-- 	-- t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
		-- 	-- x = { "<cmd>SnipTerminate<cr>", "Terminate" },
	},

	T = {
		name = "Terminal",
		["1"] = { ":1ToggleTerm<cr>", "1" },
		["2"] = { ":2ToggleTerm<cr>", "2" },
		["3"] = { ":3ToggleTerm<cr>", "3" },
		["4"] = { ":4ToggleTerm<cr>", "4" },
		-- p = { ":lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { ":ToggleTerm direction=float<cr>", "Float" },
		h = { ":ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { ":ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	t = {
		name = "Tab",
		-- t = {
		--   ":lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
		--   "Find Tab",
		-- },
		n = { ":tabnew %<cr>", "New Tab" },
		c = { ":tabclose<cr>", "Close Tab" },
		o = { ":tabonly<cr>", "Only Tab" },
		-- name = "Treesitter",
		-- h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
		-- p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
		-- name = "Test",
		--   n = { "<cmd>lua require('neotest').run.run()" }, -- nearest test
		--   d = { "<cmd>lua require('neotest').run.run(strategy = 'dap')" }, -- debug the nearest test
		--   f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))" }, -- run the current file
		--   s = { "<cmd>lua require('neotest').run.stop()" } -- stop the nearest test
	},
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
	-- s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
-- which_key.register(m_mappings, m_opts)
