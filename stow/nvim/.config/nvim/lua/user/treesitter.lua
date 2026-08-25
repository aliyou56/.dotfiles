local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false
  -- event = { "BufReadPost", "BufNewFile" },
  -- build = ":TSUpdate",
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>Ti", "<cmd>TSInstallInfo<CR>", desc = "Info", hidden = true },
  }

  require("nvim-treesitter").setup {
    init = function()
      local ensure_installed = {
        "bash",
        "c",
        "css",
        "elixir",
        "heex",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        -- "markdown_inline",
        "python",
        "ruby",
        "rust",
        "scala",
        "tsx",
        "typescript",
        "terraform",
        "yaml",
      }
      local installed = require("nvim-treesitter.configs").get_installed()
      local toInstall = vim.iter(ensure_installed)
        :filter(function(parser)
          return not vim.tbl_contains(installed, parser)
        end)
        :totable()
        require("nvim-treesitter").install(toInstall)
    end,
    ignore_install = { "" },
    sync_install = false,
    highlight = {
      enable = true,
      -- disable = { "markdown" },
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
    auto_install = false,
    modules = {},
    indent = {
      enable = true,
      -- disable = { "yaml" },
    },
    autopairs = { enable = true },
  }
end

return M
