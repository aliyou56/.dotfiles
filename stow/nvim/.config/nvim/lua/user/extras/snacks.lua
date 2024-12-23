local M = {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      -- -- automatically configure lazygit to use the current colorscheme
      -- -- and integrate edit with the current neovim instance
      configure = true,
      -- extra configuration for lazygit that will be merged with the default
      -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
      -- you need to double quote it: `"\"test\""`
      config = {
        os = { editPreset = "nvim-remote" },
        gui = {
          -- set to an empty string "" to disable icons
          nerdFontsVersion = "3",
        },
      },
      theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
      -- Theme for lazygit
      theme = {
        [241]                      = { fg = "Special" },
        activeBorderColor          = { fg = "MatchParen", bold = true },
        cherryPickedCommitBgColor  = { fg = "Identifier" },
        cherryPickedCommitFgColor  = { fg = "Function" },
        defaultFgColor             = { fg = "Normal" },
        inactiveBorderColor        = { fg = "FloatBorder" },
        optionsTextColor           = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
        unstagedChangesColor       = { fg = "DiagnosticError" },
      },
      win = {
        style = "lazygit",
      },
    },
    -- input = {
    --   enabled = true,
    --   icon = " ",
    --   icon_hl = "SnacksInputIcon",
    --   icon_pos = "left",
    --   prompt_pos = "title",
    --   win = { style = "input" },
    --   expand = true,
    -- },
    zen = { enabled = true },
    -- scroll = {
    --   enabled = true,
    --   animate = {
    --     duration = { step = 15, total = 250 },
    --     easing = "linear",
    --   },
    --   spamming = 10, -- threshold for spamming detection
    --   -- what buffers to animate
    --   filter = function(buf)
    --     return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
    --   end,
    -- }
  },

  keys = {
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    -- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    -- { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    -- { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    -- { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    -- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    -- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  },
}

return M
