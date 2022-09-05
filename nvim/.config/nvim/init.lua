if vim.g.vscode then
  -- VSCode extension
else
 require "user.options"
 require "user.keymaps"
 require "user.plugins"
 require "user.autocommands"
 require "user.stabilize"
 require "user.colorscheme"
 require "user.colorizer"
 require "user.cmp"
 require "user.nvim-navic"
 require "user.telescope"
 require "user.treesitter"
 require "user.autopairs"
 require "user.comment"
 require "user.todo-comments" -- Highlight, list and search todo comments.
 require "user.gitsigns"
 require "user.git-blame"
 require "user.gitlinker"
 require "user.notify"
 require "user.diffview" -- single tabpage interface for easily cycling through diff 
 require "user.nvim-tree"
 require "user.bufferline"
 require "user.lualine"
 require "user.toggleterm"
 require "user.project"
 require "user.impatient"
 require "user.illuminate"   -- Automatically hilighting other uses of the current word under the curosor
 require "user.indentline"
 require "user.better-escape"
 require "user.alpha"
 require "user.lsp"
 require "user.dap"
 require "user.nvim-metals"
 require "user.functions"
 require "user.winbar"
 require "user.nvim-webdev-icons"
 require "user.neoscroll"    -- Smooth scrolling
 -- require "user.hlslens"      -- Hlsearch Lens
 require "user.ufo"          -- Ultra Fold in Neovim
 require "user.auto-session"  -- A small automated session manager
 require "user.tabnine"
 require "user.whichkey"
 -- require "user.hydra"        -- Bind a bunch of key bindings together
 require "user.hop"
 require "user.trouble"
 -- require "user.fidget"
 -- require "user.nvim-transparent"
 require "user.surround"
end
