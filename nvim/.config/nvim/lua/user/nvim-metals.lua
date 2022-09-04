local api = vim.api
local cmd = vim.cmd

-- local function map(mode, lhs, rhs, opts)
--   local options = { noremap = true }
--   if opts then
--     options = vim.tbl_extend("force", options, opts)
--   end
--   api.nvim_set_keymap(mode, lhs, rhs, options)
-- end

vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F")

local keymap = vim.keymap.set
local opts = { silent = true }

-- LSP mappings
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- keymap("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
-- keymap("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
keymap("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap("n", "<leader>ws", "<cmd>lua require'metals'.hover_worksheet<CR>")
keymap("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workplace diagnostics
keymap("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E")<CR>]]) -- all workplace errorsk
keymap("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W")<CR>]])
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
keymap("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
keymap("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")


-------------------------------------
----- LSP Setup
-------------------------------------
local metals_conf = require("metals").bare_config()

-- Example of settings
metals_conf.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" }
}

metals_conf.init_options.statusBarProvider = "on"

local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_conf.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Debug settings (nvim-dap)
local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      -- args = { "firstArg", "secongArgs" }
    }
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget"
    }
  }
}

metals_conf.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end

-- Autocmd that will actuallybe in charge od starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_conf)
  end,
  group = nvim_metals_group
})
