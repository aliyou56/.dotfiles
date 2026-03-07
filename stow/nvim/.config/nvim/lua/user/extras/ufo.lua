local M = {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
}

function M.config()

  require("ufo").setup {

    preview = {
      win_config = {
        border = 'rounded',
        winblend = 12,
        winhighlight = 'Normal:Folded'
      }
    },
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local suffix = (' ↙ %d lines '):format(endLnum - lnum)
      table.insert(virtText, {suffix, 'Comment'})
      return virtText
    end
  }

  local wk = require "which-key"
  wk.add {
    { "za", desc = "Toggle fold" },
    { "zM", "<cmd>lua require('ufo').closeAllFolds<cr>", desc = "Close all folds" },
    { "zR", "<cmd>lua require('ufo').openAllFolds<cr>", desc = "Open all folds" },
  }
end

return M
