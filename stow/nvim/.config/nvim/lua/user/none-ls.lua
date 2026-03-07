local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  -- local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = true,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.shfmt,

      formatting.sql_formatter,
      formatting.yamlfmt,
      formatting.rubocop,

      -- formatting.jq,

      -- diagnostics.luacheck,
      -- diagnostics.shellcheck,
      -- diagnostics.sqlfluff,
      -- diagnostics.tidy,
      -- diagnostics.markdownlint,

      -- formatting.eslint,
      -- diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
  }
  -- vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = "formattes code using none-ls" })
end

return M
