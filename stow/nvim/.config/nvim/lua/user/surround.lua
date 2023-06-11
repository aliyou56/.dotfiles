local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	return
end

surround.setup({
	keymaps = { -- vim-surround style keymaps
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		-- normal = y"s",
		-- normal_cur = y"ss",
		-- normal_line = y"S",
		-- normal_cur_line = y"SS",
		-- visual = S"s",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
})

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>'", [[ysiw']], opts)

vim.cmd([[nmap <leader>' siw']])
