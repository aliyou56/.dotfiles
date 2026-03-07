local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
}

function M.config()
  local Snacks = require"snacks"
  local icons = require"user.icons"

  local explorer_config = {
    layout = {
      layout = {
        preset = "sidebar",
        position = "right",
        width = 40
      }
    }
  }

  local wk = require "which-key"
  wk.add {
    -- Navigation
    { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },

    -- Files (f prefix)
    { "<leader>f", group = "Find" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>ft", function() Snacks.picker.grep_buffers() end, desc = "Grep Buffers" },

    -- Git (g prefix)
    { "<leader>g", group = "Git" },
    -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>gB", function() Snacks.git.blame_line() end, desc = "Blame Line" },
    -- { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Branches" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Status" },
    -- { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },

    -- search
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep Word", mode = { "n", "x" } },

    -- UI/Notifications (u/n prefix)
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>N", function() Snacks.picker.notifications() end, desc = "Pick Notifications" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications" },

    -- Buffers
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },

    -- Zen/Focus
    { "<leader>z", function() Snacks.zen() end, desc = "Zen Mode" },
    { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Zoom" },

    -- Explorer
    { "<leader>e", function() Snacks.explorer(explorer_config) end, desc = "Explorer" },

    -- Other
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },


    -- { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" } },

    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
  }

  Snacks.setup {
    git = { enabled = true },
    bufdelete = { enabled = true },
    lazygit = { enabled = true },
    notify = { enabled = true },
    zen = { enabled = true },
    scratch = { enabled = true },

    -- terminal = {
    --   enabled = true,
    --   win = {
    --     position = "bottom",
    --     height = 0.3,
    --     border = "rounded",
    --   },
    --   -- override = function(cmd, opts)
    --   --   vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = true, desc = "Exit terminal mode" })
    --   -- --   vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { buffer = true })
    --   -- --   vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { buffer = true })
    --   -- --   vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { buffer = true })
    --   -- --   vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { buffer = true })
    --   -- end,
    -- },
    -- rename = { enabled = true }, -- rename file
    words = {
      enabled = true,
      debounce = 200,
    },
    statuscolumn = {
      enabled = true,
      left = { "mark", "sign" },
      right = { "fold", "git" },
      folds = {
        open = false,
        git_hl = false,
      },
      git = {
        patterns = { "GitSign", "MiniDiffSign" },
      },
    },

    picker = {
      enable = true,
      hidden = true,
      ignore = true,
      -- file_ignore_patterns = {
      --   "^target/",
      --   "^node_modules/",
      --   "^build/",
      --   "^coverage/",
      --   "^%.history/",
      --   "^%.git/",
      --   "^%.DS_Store$",
      --   "^%.metals/",
      --   "^%.bloop/",
      -- },

      formatters = {
        file = {
          filename_first = true,  -- Show filename before directory
        },
      },
      sources = {
        files = {
          hidden = true,
          ignored = true,
          follow = true,  -- Follow symlinks
          exclude = {
            "target/",
            "node_modules/",
            "build/",
            "coverage/",
            ".history/",
            ".git/",
            ".DS_Store$",
            ".metals/",
            ".bloop/",
            "__pycache__/",
            ".pytest_cache/",
            ".venv/"
          },
        },
        explorer = { hidden = true, ignored = true },
      },
    },

    input = {
      enabled = true,
      icon = icons.ui.Edit,
      icon_hl = 'SnacksInputIcon',
      icon_pos = 'left',
      prompt_pos = 'title',
      win = { style = 'input' },
      expand = true,
    },

    -- scroll = {
    --   enabled = true,
    --
    --   -- animate = {
    --   --   duration = { 
    --   --     step = 10,    -- Lower = faster (default 15)
    --   --     total = 150   -- Lower = faster (default 250)
    --   --   },
    --   --   easing = "linear",  -- or "inOutQuad", "outCubic" for smoother feel
    --   -- },
    --   spamming = 10,
    --
    --   animate = {
    --     -- duration = { step = 8, total = 120 },
    --     easing = "linear",
    --   },
    --
    --   -- Only animate large jumps (Ctrl-D, Ctrl-U, gg, G)
    --   -- Skip small motions (j, k) for responsiveness
    --   filter = function(buf)
    --     if vim.bo[buf].buftype ~= "" then return false end
    --     -- Only animate if jumping more than 10 lines
    --     local jump_size = math.abs(vim.v.count1)
    --     return jump_size > 10
    --   end,
    -- },

    notifier = {
      enabled = true,
      timeout = 3000,  -- Auto-dismiss after 3 seconds
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true,
      sort = { "level", "added" },
      level = vim.log.levels.INFO,  -- Minimum level to show
      icons = {
        debug = icons.ui.Bug,
        error = icons.diagnostics.Error,
        info = icons.diagnostics.Information,
        trace = icons.ui.BookMark,
        warn = icons.diagnostics.Warning,
      },
      style = 'compact',
      top_down = true,
      -- date_format = '%R',
      -- more_format = ' ↓ %d lines ',
      -- refresh = 50,
    },

    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                   __                
      ___     ___    ___   __  __ /\_\    ___ ___    
     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
        ]],
        keys = {
          { icon = icons.ui.Files, key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
          { icon = icons.ui.NewFile, key = "n", desc = "New File", action = ":enew" },
          { icon = icons.ui.Text, key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
          { icon = icons.ui.History, key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
          { icon = icons.ui.Gear, key = "c", desc = "Config", action = ":e $MYVIMRC" },
          { icon = icons.ui.SignOut, key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  }
end

return M
