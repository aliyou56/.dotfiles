
-- Fixes Autocomment
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     vim.cmd "set formatoptions-=cro"
--   end,
-- })

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "fzf", "qf", "help", "man", "lspinfo", "spectre_panel", "Trouble" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local buf_ft = vim.bo.filetype
    if buf_ft == "" or buf_ft == nil then
      vim.cmd [[
        nnoremap <silent> <buffer> q :close<CR>
        nnoremap <silent> <buffer> <c-j> j<CR>
        nnoremap <silent> <buffer> <c-k> k<CR>
        set nobuflisted
      ]]
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, "/")
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir() .. " - nvim"
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "term://*" },
  callback = function()
    vim.cmd "startinsert!"
    vim.opt.cmdheight = 1
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

local function handle_command(cmd)
  vim.cmd(cmd)
  local matches = #vim.fn.getqflist()
  if matches > 0 then
    vim.cmd "copen"
  else
    vim.api.nvim_err_writeln("No matches were found")
  end
end

vim.api.nvim_create_user_command("ExtGrep", function(params)
  local command = "silent grep"
  local has_extension = #params.fargs > 1

  if params.bang then
    -- -uu = search ignored and hidden files and directories
    command = command .. " -uu"
  end

  if has_extension then
    local ext = params.fargs[1]
    local query = ""
    for index, arg in ipairs(params.fargs) do
      if index > 1 then
        query = query .. " " .. arg
      end
    end
    command = command .. " -g " .. vim.fn.shellescape(("*.%s"):format(ext))
    command = command .. query
  else
    command = command .. " " .. params.args
  end

  handle_command(command)
end, {
    nargs = "+",
    bang = true,
    desc = "Call grep silently for a specific file extension (first parameter) and open the quickfix list"
})
