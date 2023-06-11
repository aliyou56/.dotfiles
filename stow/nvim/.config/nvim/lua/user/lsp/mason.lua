local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local mlc_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlc_status_ok then
	return
end

local servers = {
	"bashls",
	"elixirls",
	"html",
	"jsonls",
	"lemminx", -- xml
	"pyright",
	-- "rust_analyzer",
	-- "ruff_lsp",
	"sqlls",
	"lua_ls",
	"yamlls",
	-- "zk",
	-- "tsserver",
	-- "cssls",
	-- "clangd",
	-- "ansiblels",
	-- "dockerls",
	-- "gopls",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			-- package_installed = "◍",
			-- package_pending = "◍",
			-- package_uninstalled = "◍",
      package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	-- if server == "bashls" then
	-- 	local lsp_opts = require("user.lsp.settings.bashls")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end
	-- if server == "cssls" then
	-- 	local lsp_opts = require("user.lsp.settings.cssls")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end
	-- if server == "elixirls" then
	-- 	local lsp_opts = require("user.lsp.settings.elixirls")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end
	-- if server == "html" then
	-- 	local lsp_opts = require("user.lsp.settings.html")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end
	-- if server == "jsonls" then
	-- 	local jsonls_opts = require("user.lsp.settings.jsonls")
	-- 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	-- end
	-- if server == "lemminx" then
	-- 	local lsp_opts = require("user.lsp.settings.lemminx")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end
	-- if server == "sqlls" then
	-- 	local lsp_opts = require("user.lsp.settings.sqlls")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end
	-- if server == "zk" then
	-- 	local lsp_opts = require("user.lsp.settings.zk")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end

	-- if server == "yamlls" then
	-- 	local lsp_opts = require("user.lsp.settings.yamlls")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end

	if server == "lua_ls" then
		local lsp_opts = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
          telemetry = {
            enable = false,
          },
				},
			},
		}
		opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	end

	-- if server == "tsserver" then
	-- 	local lsp_opts = require("user.lsp.settings.tsserver")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end

	if server == "pyright" then
		local lsp_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	end
	-- if server == "ruff_lsp" then
	-- 	local lsp_opts = require("user.lsp.settings.ruff")
	-- 	opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- end

	-- if server == "rust_analyzer" then
	-- 	local lsp_opts = require("user.lsp.settings.rust")
	-- 	-- opts = vim.tbl_deep_extend("force", lsp_opts, opts)
	-- 	local rust_tools_status_ok, rust_tools = pcall(require, "rust_tools")
	-- 	if not rust_tools_status_ok then
	-- 		return
	-- 	end

	-- 	rust_tools.setuo(rust_opts)
	-- 	goto continue
	-- end

	lspconfig[server].setup(opts)
	::continue::
end
