local M = {
  -- https://github.com/kristijanhusak/vim-dadbod-ui
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}

-- function M.config()
--   -- require("vim-dadbod").setup()
--   -- require("vim-dadbod-completion").setup()
--   require("vim-dadbod-ui").setup ( -- Your DBUI configuration
--     vim.g.db_ui_use_nerd_fonts = 1 )
-- end

return M
