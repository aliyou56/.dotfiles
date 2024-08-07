local M = {
  "glepnir/lspsaga.nvim",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local saga = require "lspsaga"
  local keymap = vim.keymap.set
  local opts = { silent = true }

  saga.setup {
    -- keybinds for navigation in lspsaga window
    -- move_in_saga = { prev = "<C-p>", next = "<C-n>" },
    -- use enter to open file with finder
    finder_action_keys = {
      open = "<CR>",
    },
    -- use enter to open file with definition preview
    definition_action_keys = {
      edit = "<CR>",
    },
  }

  -- Lsp finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  keymap("n", "gh", ":Lspsaga finder<CR>", opts)

  keymap({"n", "v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

  -- keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

  -- Peek Definition
  -- you can edit the definition file in this flaotwindow
  -- also support open/vsplit/etc operation check definition_action_keys
  -- support tagstack C-t jump back
  keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)

  -- Show line diagnostics
  -- keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

  -- -- Show cursor diagnostic
  -- keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

  -- Diagnsotic jump can use `<c-o>` to jump back
  keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

  -- Only jump to error
  keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, opts)
  keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, opts)

  -- Outline
  keymap("n","<leader>o", ":Lspsaga outline<CR>",opts)

  -- Hover Doc
  -- keymap("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts)

  -- Float terminal
  -- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", opts)
  -- if you want pass somc cli command into terminal you can do like this
  -- open lazygit in lspsaga float terminal
  -- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", opts)
  -- close floaterm
  -- keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)
end

return M
