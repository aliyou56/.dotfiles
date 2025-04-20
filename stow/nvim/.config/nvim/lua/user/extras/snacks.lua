local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
}

function M.config()
  local Snacks = require"snacks"
  local icons = require"user.icons"

  local wk = require "which-key"
  wk.add {
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    -- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>gB", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    -- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },


    -- Top Pickers & Explorer
    { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    -- { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>N", function() Snacks.picker.notifications() end, desc = "Notification History" },
    {
      "<leader>e",
      function()
        Snacks.explorer({
          layout = {
            layout = {
              preset = "sidebar",
              position = "right",
              width = 40
            }
          }
        })
      end,
      desc = "File Explorer"
    },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    -- -- git
    -- { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    -- { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    -- { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    -- { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    -- { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    -- { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    -- -- Grep
    -- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>ft", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    -- { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
  }

  Snacks.setup {
    git = { enabled = true },
    bufdelete = { enabled = true },
    lazygit = { enabled = true },
    input = {
      enabled = true,
      icon = icons.ui.Edit,
      icon_hl = 'SnacksInputIcon',
      icon_pos = 'left',
      prompt_pos = 'title',
      win = { style = 'input' },
      expand = true,
    },
    notifier = {
      enabled = true,
      icons = {
        debug = icons.ui.Bug,
        error = icons.diagnostics.Error,
        info = icons.diagnostics.Information,
        trace = icons.ui.BookMark,
        warn = icons.diagnostics.Warning,
      },
      -- style = 'compact',
      -- top_down = true,
      -- date_format = '%R',
      -- more_format = ' ↓ %d lines ',
      -- refresh = 50,
    },
    notify = { enabled = true },
    zen = { enabled = true },

    -- picker = { enable = true },
    -- indent = {
    --   enabled = true,
    --   priority = 1,
    --   char = '│',
    --   -- blank = nil, ---@type string? blank space character. If nil, it will use listchars when list is enabled.
    --   -- blank = "∙",
    --   only_scope = false,
    --   only_current = false,
    --   hl = {
    --       'SnacksIndent1',
    --       'SnacksIndent2',
    --       'SnacksIndent3',
    --       'SnacksIndent4',
    --       'SnacksIndent5',
    --       'SnacksIndent6',
    --       'SnacksIndent7',
    --       'SnacksIndent8',
    --   },
    -- },
    --
    -- scroll = { enabled = false },
  --   -- scroll = {
  --   --   enabled = true,
  --   --   animate = {
  --   --     duration = { step = 15, total = 250 },
  --   --     easing = "linear",
  --   --   },
  --   --   spamming = 10, -- threshold for spamming detection
  --   --   -- what buffers to animate
  --   --   filter = function(buf)
  --   --     return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
  --   --   end,
  --   -- }
  }
end

return M
