local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  confirm = true,
  cursorline = true,                       -- highlight the current line
  expandtab = true,                        -- convert tabs to spaces
  -- fileencoding = "utf-8",                  -- the encoding written to a file
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  inccommand = "nosplit", -- preview incremental substitute
  laststatus = 3,
  list = true, -- Show some invisible characters (tabs...
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  pumblend = 10,                          -- pop up menu height
  pumheight = 10,                          -- pop up menu height
  relativenumber = true,                   -- set relative numbered lines
  ruler = false,
  scrolloff = 8,                           -- Lines of context
  sessionoptions = { "buffers", "curdir", "folds", "tabpages", "winpos", "winsize" },
  shiftround = true, -- Round indent
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  showcmd = false,
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 1,                         -- always show tabs
  sidescrolloff = 8, -- Columns of context
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                        -- D'ont ignore case with capitals
  smartindent = true,                      -- Insert indents automatically
  splitbelow = true,                       -- Put new windows below current
  splitkeep = "screen",
  splitright = true,                       -- Put new windows right of current
  swapfile = false,                        -- creates a swapfile
  tabstop = 2,                             -- insert 2 spaces for a tab
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true,                            -- set the title of window to the value of the titlestring
  titlestring = "%<%F - nvim",             -- what the title of the window will be set to
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                        -- faster completion (4000ms default)
  wildmode = "longest:full,full", -- Command-line completion mode
  wildignore = { ".git", "*/node_modules/*", "*/target/*", ".metals", ".history" },
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  wrap = false,                            -- display lines as one long line

  foldenable = true,
  -- foldmethod = "expr",
  -- foldexpr = "nvim_treesitter#foldexpr()",
  foldcolumn = '1',
  foldlevel = 99,                          -- Using ufo provider need a large value
  foldlevelstart = 99,

  grepprg = "rg -S --vimgrep $*",
  grepformat = "%f:%l:%c:%m",
  formatoptions = "jcroqlnt" -- tcqj,
}

vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Fix markdown indentation settings
-- vim.g.markdown_recommended_style = 0
-- vim.g.python3_host_prog = '/home/aliyou/py3nvim/bin/python'

