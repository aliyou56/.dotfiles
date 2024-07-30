local M = {
  "folke/trouble.nvim",
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>ld", "<cmd>Trouble<cr>", desc = "Diagnostics" },
    { "<leader>lt", "<cmd>TodoTrouble<cr>", desc = "TODO" },

    --  {
    --   "<leader>xx",
    --   "<cmd>Trouble diagnostics toggle<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "<leader>xX",
    --   "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    --   desc = "Buffer Diagnostics (Trouble)",
    -- },
    -- {
    --   "<leader>cs",
    --   "<cmd>Trouble symbols toggle focus=false<cr>",
    --   desc = "Symbols (Trouble)",
    -- },
    -- {
    --   "<leader>cl",
    --   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    --   desc = "LSP Definitions / references / ... (Trouble)",
    -- },
    -- {
    --   "<leader>xL",
    --   "<cmd>Trouble loclist toggle<cr>",
    --   desc = "Location List (Trouble)",
    -- },
    -- {
    --   "<leader>xQ",
    --   "<cmd>Trouble qflist toggle<cr>",
    --   desc = "Quickfix List (Trouble)",
    -- },
  }
  require("trouble").setup()
end

return M
