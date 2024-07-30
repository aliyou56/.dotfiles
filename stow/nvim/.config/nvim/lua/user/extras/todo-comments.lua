local M = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPre",
}

function M.config()
  require("todo-comments").setup()
end

return M
