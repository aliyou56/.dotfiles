vim.g.gitblame_enabled = 0
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_message_template = "<summary> • <date> • <author>"
vim.g.gitblame_highlight_group = "LineNr"

local gs_status_ok, gitsigns = pcall(require, "gitsigns")
if not gs_status_ok then
  return
end

local gl_status_ok, gitlinker = pcall(require, "gitlinker")
if not gl_status_ok then
  return
end

gitlinker.setup({
  opts = {
    callbacks = {
      ["github.com"] = require("gitlinker.hosts").get_github_type_url,
      ["gitlab.com"] = require("gitlinker.hosts").get_gitlab_type_url,
    },
    -- remote = 'github', -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- callback for what to do with the url
    action_callback = require("gitlinker.actions").open_in_browser,
    -- print the url after performing the action
    print_url = false,
    -- mapping to call url generation
    mappings = "<leader>gy",
  },
})

gitsigns.setup({
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  --  auto_attach = true,
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,  -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'rounded', -- single
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
})

-- local dv_status_ok, diffview = pcall(require, "diffview")
-- if dv_status_ok then
-- 	diffview.setup()
-- end
