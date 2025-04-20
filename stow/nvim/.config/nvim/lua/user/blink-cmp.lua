local M = {
  "saghen/blink.cmp",
  event = "InsertEnter",
  -- dependencies = {
  --   "L3MON4D3/LuaSnip",
  -- },
  version = "1.*",
}

-- documentation: https://cmp.saghen.dev/

M.config = function()
  require("blink.cmp").setup {
    keymap = {
      preset = "default", -- enter
      ["<C-y>"] = { "select_and_accept" },
      ["<Tab>"]   = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback"},

      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["Down"] = { "select_next", "fallback" },
      ["Up"] = { "select_prev", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
    },
    completion = {
      ghost_text = { enabled = true },
      -- Don't select by default, auto insert on selection
      list = {
        selection = {
          preselect = function(ctx) return vim.bo.filetype ~= "markdown" end,
          auto_insert = function(ctx) return vim.bo.filetype == "markdown" end,
        }
      },
      documentation = { auto_show = true, auto_show_delay_ms = 500, },
      menu = {
        draw = {
          columns = { { "kind_icon", "label", gap = 1 }, { "kind" } },
          components = {
            -- kind_icon = {
            --   text = function(ctx) return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' ' end
            -- }
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              -- highlight = function(ctx)
              --   local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              --   return hl
              -- end,
            },
            -- kind = {
            --   -- (optional) use highlights from mini.icons
            --   highlight = function(ctx)
            --     local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
            --     return hl
            --   end,
            -- }
          }
        }
      }
    },
    -- cmdline = { enabled = true },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = { sql = { 'dadbod' } },
      providers = {
        -- cmdline = { -- ?
        --   -- ignores cmdline completions when executing shell commands
        --   enabled = function()
        --     return vim.fn.getcmdtype() ~= ":" or vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
        --   end
        -- },
        path = {
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          }
        },
        snippets = {
          min_keyword_length = 2,
        },
        buffer = {
          min_keyword_length = 2,
        },
        dadbod = { module = "vim_dadbod_completion.blink" },
      }
    },

    -- experimental signature help support
    signature = { enabled = true },
  }
end

return M
