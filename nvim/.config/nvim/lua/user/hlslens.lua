
local status_ok, hlslens = pcall(require, "hlslens")
if not status_ok then
  return
end

-- local keymap = vim.api.nvim_set_keymap
--
-- keymap("n", "n", [[<Cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>]],)
-- keymap("n", "N", [[<Cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>]], kopts)
-- keymap("n", "*", [[*<Cmd>lua require("hlslens").start()<CR>]])
-- keymap("n", "#", [[#<Cmd>lua require("hlslens").start()<CR>]])
-- keymap("n", "g*", [[g*<Cmd>lua require("hlslens").start()<CR>]])
-- keymap("n", "g#", [[g#<Cmd>lua require("hlslens").start()<CR>]])

-- keymap("n", "<Leader>l", ":noh<CR>")

