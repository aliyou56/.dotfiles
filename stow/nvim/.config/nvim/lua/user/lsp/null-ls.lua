local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with({
		-- 	extra_filetypes = { "toml" },
		-- 	extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		-- }),
    -- formatting.scalafmt,
		-- formatting.ruff,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.isort,
		formatting.stylua,
		formatting.sql_formatter,
		formatting.yamlfmt,
		formatting.jq,
		-- formatting.rustfmt,

		diagnostics.ruff,
		diagnostics.luacheck,
		diagnostics.shellcheck,
		diagnostics.sqlfluff,
		-- diagnostics.tidy,
		-- diagnostics.markdownlint,
	},
})