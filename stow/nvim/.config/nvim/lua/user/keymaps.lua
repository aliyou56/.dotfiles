local map = vim.keymap.set
local opts = { silent = true }

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<M-o>", ":lua require('bufjump').backward()<CR>", opts)
map("n", "<M-i>", ":lua require('bufjump').forward()<CR>", opts)

-- Keeping it centered
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)

map("n", "<leader>Q", "<cmd>qa<CR>", opts)
map("n", "<C-s>", "<cmd>w<CR>", opts)

-- Tabs --
map("n", "<m-t>", ":tabnew %<cr>", opts)
map("n", "<m-y>", ":tabclose<cr>", opts)
map("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

map("n", "<c-i>", "<c-i>", opts)

-- Move text up and down
map({"v", "n"}, "<A-j>", ":m .+1<CR>==", opts)
map({"v", "n"}, "<A-k>", ":m .-2<CR>==", opts)

-- Clear highlights
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
map("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- Copy/Paste
map({"n", "v"}, "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)
map("n", "<leader>p", '"+p', opts)
-- Mac/window
-- map('n', '<leader>y', '"*y', opts)
-- map('n', '<leader>p', '"*p', opts)

-- Insert --
map("i", "jk", "<ESC>", opts)

-- quit
-- map("n", "<leader>qq", "<cmd>qa<cr>", opts)

-- Undo break point
map("i", ",", ",<C-g>u", opts)
map("i", ".", ".<C-g>u", opts)
map("i", "!", "!<C-g>u", opts)
map("i", "?", "?<C-g>u", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Plugins --

-- map("n", "<leader>fo", ":copen<CR>", opts)
-- map("n", "<leader>fc", ":cclose<CR>", opts)
-- map("n", "<leader>fn", ":cnext<CR>", opts)
-- map("n", "<leader>fp", ":cprevious<CR>", opts)

-- map("n", "<leader>sr", ":source $MYVIMRC<CR>", opts)

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", opts)
map("n", "<leader>ft", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
map("n", "<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts)
map("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
-- map("n", "<leader>fm", "<cmd>lua require'telescope'.extensions.metals.commands()<CR>", opts)
-- map("n", "gds", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]], opts)
-- map("n", "gws", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]], opts)

-- Git
map("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
map("n", "<c-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
map("x", "<c-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Null-ls
-- map("n", "<leader>f", ":Format<cr>", opts)

map("n", "<C-z>", "<cmd>ZenMode<cr>", opts)

-- DAP
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- illuminate
-- vim.api.nvim_set_map('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
-- vim.api.nvim_set_map('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})

map(
  "n",
  "<tab>",
  "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
  opts
)
map(
  "n",
  "<s-tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
  opts
)

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

map("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)
