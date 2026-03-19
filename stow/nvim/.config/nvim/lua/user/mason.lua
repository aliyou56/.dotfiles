local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
  }

  local servers = require"user.lspconfig".servers

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
