local M = {
  "kwkarlwang/bufjump.nvim",
  event = "VeryLazy",
}

M.config = function()
  require("bufjump").setup()

  local map = vim.keymap.set
  map("n", "<M-o>", ":lua require('bufjump').backward()<CR>", { silent = true })
  map("n", "<M-i>", ":lua require('bufjump').forward()<CR>", { silent = true })
end

return M
