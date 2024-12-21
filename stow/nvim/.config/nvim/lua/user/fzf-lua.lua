local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  cmd = "FzfLua"
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>bb", "<cmd>FzfLua buffers<cr>", desc = "Find Buffers" },

    { "<leader>fb", "<cmd>FzfLua git_branches<cr>", desc = "Checkout branch" },
    { "<leader>fc", "<cmd>FzfLua colorschemes<cr>", desc = "Colorscheme" },
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
    -- { "<leader>fp", "<cmd>FzfLua projects<cr>", desc = "Projects" },
    { "<leader>ft", "<cmd>FzfLua live_grep<cr>", desc = "Find Text" },
    { "<leader>fs", "<cmd>FzfLua grep_cword<cr>", desc = "Find String" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags" },
    { "<leader>fH", "<cmd>FzfLua highlights<cr>", desc = "Highlights" },
    -- { "<leader>fi", "<cmd>FzfLua media_files<cr>", desc = "Media Files" },
    { "<leader>fl", "<cmd>FzfLua resume<cr>", desc = "Last Search" },
    { "<leader>fM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
    { "<leader>fR", "<cmd>FzfLua registers<cr>", desc = "Registers" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    { "<leader>fC", "<cmd>FzfLua commands<cr>", desc = "Commands" },

    { "<leader>go", "<cmd>FzfLua git_status<cr>", desc = "Open Changed Files" },
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Checkout Branch" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Checkout Commit" },
    { "<leader>gC", "<cmd>FzfLua git_bcommits<cr>", desc = "Checkout Commit (Current File)" },

    -- { "<leader>ls", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>le", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix" },
  }

  local fzf_lua = require "fzf-lua"
  fzf_lua.setup {
    -- Key mappings
    keymap = { -- Built-in mappings
      builtin = {
        ["<F1>"]  = "toggle-help",
        ["<F2>"]  = "toggle-fullscreen",
        ["<C-j>"] = "up",
        ["<C-k>"] = "down",
        ["<C-y>"] = "toggle-preview",
      },
      fzf = { -- FZF default mappings
        ["ctrl-q"] = "select-all+accept", -- select all items and conver to quickfix
      },
    },
    -- Specific picker settings
    files = {
      -- rg_opts           = "--color=always --files --hidden --follow --glob '!.git/'",
      -- fd_opts           = "--type f --hidden --follow --exclude .git",
      actions           = { -- actions for file picker
        ["ctrl-s"]      = "split",
        ["ctrl-v"]      = "vsplit",
        ["ctrl-t"]      = "tabedit",
      },
    },
    grep = {
      rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!{.git,node_modules}/*'",
      rg_glob = true,
      rg_glob_fn = function(query, opts)
        local regex, flags = query:match("^(.-)%s%-%-(.*)$")
        return (regex or query), flags
      end,
    },
    oldfiles = {
      cwd_only = true,
      stat_file = true, --verify files exists
      include_current_session = true,
    },
  }
  -- require("fzf-lua").register_ui_select()
end

return M
