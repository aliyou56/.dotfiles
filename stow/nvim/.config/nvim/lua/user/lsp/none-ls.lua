local nl_ok, none_ls = pcall(require, "null-ls")
if not nl_ok then
  vim.notify("none-ls not found")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = none_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = none_ls.builtins.diagnostics

none_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with({
		-- 	extra_filetypes = { "toml" },
		-- 	extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		-- }),
		-- formatting.ruff,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.isort,
		formatting.stylua,
		formatting.sql_formatter,
		formatting.yamlfmt,
		formatting.jq,

		diagnostics.ruff,
		diagnostics.luacheck,
		diagnostics.shellcheck,
		diagnostics.sqlfluff,
		-- diagnostics.tidy,
		-- diagnostics.markdownlint,
	},
})
