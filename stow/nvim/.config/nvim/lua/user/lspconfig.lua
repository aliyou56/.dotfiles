local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

-- https://github.com/neovim/nvim-lspconfig
M.lsp_keymaps = function(bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

  -- vim.keymap("n", "<leader>ca", "<cmd>lua require('snacks.integrations.lsp').code_actions()<cr>", opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
  vim.keymap.set("n", "<CR>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, opts)                 -- buffer diagnostics only
  -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format({ async = true }), opts)
  -- vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist(), opts)                 -- all workplace diagnostics
  -- vim.keymap.set("n", "<leader>ae", vim.diagnostic.setqflist({severity = 'E'}), opts) -- all workplace errors
  -- vim.keymap.set("n", "<leader>aw", vim.diagnostic.setqflist({severity = 'W'}), opts)
  -- vim.keymap.set("n", "[c", vim.diagnostic.goto_prev { wrap = false }, opts)
  -- vim.keymap.set("n", "]c", vim.diagnostic.goto_next { wrap = false }, opts)
  -- vim.keymap.set("n", "[c", vim.diagnostic.jump { count = 1 }, opts)
  -- vim.keymap.set("n", "]c", vim.diagnostic.jump { count = -1 }, opts)

  -- vim.keymap.set("n", "gDs", vim.lsp.buf.document_symbol, opts)
  vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, opts)
end

M.on_attach = function(client, bufnr)
  M.lsp_keymaps(bufnr)

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true)
  end
end

M.toggle_inlay_hints = function()
  -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end

function M.common_capabilities()
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

  local has_blink, blink = pcall(require, "blink.cmp")
  if has_blink then
    return blink.get_lsp_capabilities(capabilities)
  end
  return capabilities
end

function M.config()
  local wk = require "which-key"
  wk.add {
    -- {
    --   mode = {"n", "v"}, -- NORMAL and VISUAL mode
    --   {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    -- },
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
    "bashls",
    "cssls",
    "elixirls",
    "html",
    "jsonls",
    "lemminx", -- xml
    "pyright",
    "sqlls",
    "lua_ls",
    "yamlls",
    "gopls",
    "dockerls",
    "marksman",
    "eslint",
    "ts_ls",
    "elmls",
    "ruby_lsp"

    -- "solargraph",
    -- "basedpyright",
    -- "rust_analyzer",
    -- "ruff_lsp",
    -- "tailwindcss",
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
      numhl = {
        [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        [vim.diagnostic.severity.WARN] = 'WarningMsg',
        [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
        [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
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

  local server_configs = {
    elixirls = {
      cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/elixir-ls" },
    },
    ruby_lsp = {
      init_options = {
        formatter = 'standard',
        linters = { 'standard' },
      },
    },
  }

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    if server_configs[server] then
      opts = vim.tbl_deep_extend("force", opts, server_configs[server])
    end

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    lspconfig[server].setup(opts)
    -- vim.lsp.config(server, opts)
  end
  -- vim.lsp.enable(servers)
end

return M
