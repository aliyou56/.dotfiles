local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

-- local function attach_navic(client, bufnr)
--   vim.g.navic_silence = true
--   local navic = require "nvim-navic"
--   if client.server_capabilities.documentSymbolProvider then
--     navic.attach(client, bufnr)
--   end
-- end

M.lsp_keymaps = function(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  -- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- vim.keymap.set("n", "K", function()
  --   local winid = require("ufo").peekFoldedLinesUnderCursor()
  --   if not winid then
  --     vim.lsp.buf.hover()
  --   end
  -- end)

  -- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>cl", ":lua vim.lsp.codelens.run()<CR>", opts)
  -- keymap(bufnr, "n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<CR>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
  keymap(bufnr, "n", "<leader>aa", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)                 -- all workplace diagnostics
  keymap(bufnr, "n", "<leader>ae", "<cmd>lua vim.diagnostic.setqflist({severity = 'E'})<CR>", opts) -- all workplace errors
  keymap(bufnr, "n", "<leader>aw", "<cmd>lua vim.diagnostic.setqflist({severity = 'W'})<CR>", opts)
  keymap(bufnr, "n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)                 -- buffer diagnostics only
  keymap(bufnr, "n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>", opts)
  keymap(bufnr, "n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>", opts)
  -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

  -- keymap(bufnr, "n", "gDs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  keymap(bufnr, "n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
  -- keymap(bufnr, "n", "<M-f>", "<cmd>Format<cr>", opts)
end

M.on_attach = function(client, bufnr)
  M.lsp_keymaps(bufnr)
  -- attach_navic(client, bufnr)

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true)
  end
end

M.toggle_inlay_hints = function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
end

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end

function M.config()
  local wk = require "which-key"
  wk.add {
    {
      mode = {"n", "v"}, -- NORMAL and VISUAL mode
      {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    },
    {"<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },
    {"<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    {"<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    {"<leader>lh", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", desc = "Hints" },
    {"<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
    {"<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    {"<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    {"<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  }

  local lspconfig = require "lspconfig"
  local icons = require "user.icons"

  local servers = {
    -- -- "basedpyright",
    -- "marksman",
    "tailwindcss",
    "eslint",

    "bashls",
    "cssls",
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
    "gopls",
    "dockerls",
    "solargraph",
    -- "unison",
  }

  vim.diagnostic.config {
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
      },
    },
    virtual_text = true,
    update_in_insert = false, -- true
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      -- source = "if_many", -- always",
      header = "",
      prefix = "",
    },
  }

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    lspconfig[server].setup(opts)

    if server == "elixirls" then
      require("lspconfig").elixirls.setup {
        cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/elixir-ls" },
      }
    end

    -- if server == "nginx-language-server" then
    --   require("lspconfig").nginx_language_server.setup(opts)
    -- end
  end
end

return M
