-- local root_files = {
--   'pyproject.toml',
--   'setup.py',
--   'setup.cfg',
--   'requirements.txt',
--   'Pipfile',
--   'pyrightconfig.json',
-- }

-- local function organize_imports()
--   local params = {
--     command = 'pyright.organizeimports',
--     arguments = { vim.uri_from_bufnr(0) },
--   }
--   vim.lsp.buf.execute_command(params)
-- end

return {
	-- cmd = { "pyright" },
	settings = {
		-- pyright = { autoImportCompletion = true },
		python = {
			analysis = {
				autoSearchPaths = true,
				autoImportCompletions = true,
				typeCheckingMode = "basic",
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
}

-- return {
--   default_config = {
--     cmd = cmd,
--     filetypes = { 'python' },
--     single_file_support = true,
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           useLibraryCodeForTypes = true,
--           diagnosticMode = 'workspace',
--         },
--       },
--     },
--   },
--   commands = {
--     PyrightOrganizeImports = {
--       organize_imports,
--       description = 'Organize Imports',
--     },
--   },
-- }
