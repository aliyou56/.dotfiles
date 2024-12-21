local M = {
  "folke/trouble.nvim",
}

function M.config()
  require("trouble").setup()
  local wk = require "which-key"

  wk.add {
    { "<leader>ld", "<cmd>Trouble<cr>", desc = "Diagnostics" },
    -- { "<leader>lt", "<cmd>TodoTrouble<cr>", desc = "TODO" },
    {
      "<leader>lt",
      "<cmd>lua require('user.functions').toggle_diagnostics()<cr>",
      desc = "Toggle Diagnostics"
    },

    {
      "<leader>lx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      -- "<leader>xX",
      "<leader>lb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>ls",
      "<cmd>Trouble symbols toggle<cr>",
      desc = "Symbols (Trouble)",
    }
  }
end

return M
