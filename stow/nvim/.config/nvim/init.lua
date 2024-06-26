require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.autocommands")
require("user.colorscheme")
require("user.colorizer")
require("user.functions")
require("user.cmp")
require("user.lsp")
-- require("user.dap")
require("user.persisted")     -- Simple session management for Neovim with git branching, autoloading and Telescope support
require("user.bqf")           -- Better Quick Fix
require("user.ufo")           -- Ultra Fold in Neovim
require("user.git")           -- git-blame - gitsigns - gitlinker - diffview
require("user.alpha")         -- programmable greeter
require("user.telescope")     -- Find, Filter, Preview, Pick.
require("user.treesitter")    -- incremental parsing system for programming tools
require("user.toggleterm")    -- manage multiple terminal windows
require("user.nvim-tree")     -- file explorer
require("user.nvim-webdev-icons")
require("user.nvim-navic")
require("user.comment")       -- comment - todo-comments
require("user.lualine")
require("user.project")
require("user.notify")
require("user.autopairs")
require("user.ibl")
-- require("user.harpoon")
require("user.illuminate") -- Automatically hilighting other uses of the current word under the curosor
require("user.inlay-hints")
require("user.whichkey")
-- require("user.zen-mode")
require("user.neoscroll") -- Smooth scrolling
require("user.better-escape")

require("user.surround")
require("user.fidget") -- Standalone UI for nvim-lsp progress
require("user.numb")   -- Peeking the buffer while entering command :{number} require("user.zen-mode")

-- -- require "user.bufferline"
-- vim.keymap.set({ 'n' }, '<C-k>', function()       require('lsp_signature').toggle_float_win()
--     end, { silent = true, noremap = true, desc = 'toggle signature' })

--     vim.keymap.set({ 'n' }, '<Leader>k', function()
--      vim.lsp.buf.signature_help()
--     end, { silent = true, noremap = true, desc = 'toggle signature' })
