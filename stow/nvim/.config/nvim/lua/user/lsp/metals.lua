local status_ok, metals = pcall(require, "metals")
if not status_ok then
	return
end

-- vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
-- vim.opt_global.shortmess:remove("F")

local metals_conf = metals.bare_config()

metals_conf = {
	init_options = { statusBarProvider = "on" },
	capabilities = require("user.lsp.handlers").capabilities,
	settings = {
		showImplicitArguments = true,
		showImplicitConversionsAndClasses = true,
		showInferredType = true,
		serverVersion = "latest.snapshot",
		excludedPackages = {
			"akka.actor.typed.javadsl",
			"com.github.swagger.akka.javadsl",
		},
	},
}

metals_conf.on_attach = function(client, bufnr)
	metals.setup_dap()
	require("user.lsp.handlers").on_attach(client, bufnr)

  local opts = { noremap = true, silent = true }
  local map = vim.keymap.set

  map("n", "<leader>mmc", metals.commands)
	map("n", "<leader>mc", "<cmd>:lua require'telescope'.extensions.metals.commands()<CR>")
	map("n", "<leader>mh", "<cmd>:lua require'metals'.hover_worksheet()<CR>")
	map("n", "<leader>mtt", require("metals.tvp").toggle_tree_view)
  map("n", "<leader>mtr", require("metals.tvp").reveal_in_tree)
  map("n", "<leader>mts", function()
    metals.toggle_setting("showImplicitArguments")
  end)
end

-- Autocmd that will actually be in charge of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sc", "sbt", "java" },
	callback = function()
		metals.initialize_or_attach(metals_conf)
	end,
	group = nvim_metals_group,
})
