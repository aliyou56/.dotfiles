
local status_ok, autosession = pcall(require, "auto-session")
if not status_ok then
  return
end

local t_status_ok, telescope = pcall(require, "telescope")
if not t_status_ok then
  return
end

local l_status_ok, session_lens = pcall(require, "session-lens")
if not l_status_ok then
  return
end

local opts = {
  log_level = "info",
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
  auto_session_enabled = true,
  auto_saved_enabled = nil,
  auto_session_suppress_dirs = {
    -- "~/", "~/Projects"
    os.getenv "HOME",
  },
  auto_session_use_git_branch = nil,
  -- the configs bellow are lua only
  bypass_session_save_file_type = { "alpha" }
}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

telescope.load_extension "session-lens"

session_lens.setup {
  path_display = { "shorten" },
  -- theme_conf = { border = false },
  previwer = false,
  prompt_tile = "Session"
}

autosession.setup(opts)

