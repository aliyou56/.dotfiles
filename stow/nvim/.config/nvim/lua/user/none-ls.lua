local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = true,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      formatting.shfmt,

    -- formatting.isort,
    formatting.sql_formatter,
    formatting.yamlfmt,

    -- formatting.jq,

    -- diagnostics.ruff,
    -- diagnostics.luacheck,
    -- diagnostics.shellcheck,
    -- diagnostics.sqlfluff,
    -- diagnostics.tidy,
    -- diagnostics.markdownlint,

      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
