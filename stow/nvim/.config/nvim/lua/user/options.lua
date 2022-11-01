local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 0,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cursorline = true,                       -- highlight the current line
  expandtab = true,                        -- convert tabs to spaces
  fileencoding = "utf-8",                  -- the encoding written to a file
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  laststatus = 3,
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  pumheight = 10,                          -- pop up menu height
  relativenumber = true,                   -- set relative numbered lines
  ruler = false,
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  scrolloff = 8,                           -- is one of my fav
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  showcmd = false,
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitkeep = "screen",
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  tabstop = 2,                             -- insert 2 spaces for a tab
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true,                            -- set the title of window to the value of the titlestring
  titlestring = "%<%F - nvim",             -- what the title of the window will be set to
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                        -- faster completion (4000ms default)
  wrap = false,                            -- display lines as one long line
  wildignore = { ".git", "*/node_modules/*", "*/target/*", ".metals", ".history" },
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  foldenable = true,
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldcolumn = '1',
  foldlevel = 99,                          -- Using ufo provider need a large value
  foldlevelstart = -1,

  grepprg = "rg -S --vimgrep $*",
  grepformat = "%f:%l:%c:%m",
}

vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
	stl = " ",
})
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.python3_host_prog = '/home/aliyou/py3nvim/bin/python'

