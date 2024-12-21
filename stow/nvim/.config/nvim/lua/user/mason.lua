local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.execs = {
  "bashls",
  "elixirls",
  "html",
  "jsonls",
  "lemminx", -- xml
  "lua_ls",
  "marksman",
  "pyright",
  "rust_analyzer",
  -- "sqlls",
  "yamlls",
  "dockerls",
  -- "eslint",
  -- "cssls",
  "gopls",
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = M.execs,
  }
end

return M
