local M = {
  "ramilito/kubectl.nvim",
}

function M.config()
  require("kubectl").setup()
  vim.keymap.set("n", "<leader>k", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })
end

return M
