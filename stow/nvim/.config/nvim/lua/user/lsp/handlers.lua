local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.foldingRange = { -- ufo
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local icons = require("user.icons")
	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "if_many", -- always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
  local api = vim.api
  -- local keymap = vim.keymap.set

	-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	-- keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]], opts)
	keymap(bufnr, "n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
	keymap(bufnr, "n", "<leader>aa", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts) -- all workplace diagnostics
	keymap(bufnr, "n", "<leader>ae", "<cmd>lua vim.diagnostic.setqflist({severity = 'E'})<CR>", opts) -- all workplace errors
	keymap(bufnr, "n", "<leader>aw", "<cmd>lua vim.diagnostic.setqflist({severity = 'W'})<CR>", opts)
	keymap(bufnr, "n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) -- buffer diagnostics only
	keymap(bufnr, "n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>", opts)
	keymap(bufnr, "n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

	-- keymap(bufnr, "n", "gDs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
	keymap(bufnr, "n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
	-- keymap(bufnr, "n", "<M-f>", "<cmd>Format<cr>", opts)

  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	attach_navic(client, bufnr)

	function M.enable_format_on_save()
		vim.cmd([[
      augroup format_on_save
        autocmd! 
        autocmd BufWritePre * lua vim.lsp.buf.format({ async = true }) 
      augroup end
    ]])
		vim.notify("Enabled format on save")
	end

	function M.disable_format_on_save()
		M.remove_augroup("format_on_save")
		vim.notify("Disabled format on save")
	end

	function M.toggle_format_on_save()
		if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
			M.enable_format_on_save()
		else
			M.disable_format_on_save()
		end
	end

	function M.remove_augroup(name)
		if vim.fn.exists("#" .. name) == 1 then
			vim.cmd("au! " .. name)
		end
	end

	vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]])
end

return M
