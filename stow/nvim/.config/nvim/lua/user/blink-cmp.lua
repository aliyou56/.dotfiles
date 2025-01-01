local M = {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    -- "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
  },
  -- use a release tag to download pre-built binaries
  version = '*',
}

-- documentation: https://cmp.saghen.dev/

M.config = function()
  require("blink.cmp").setup {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
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
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = { border = "rounded" },
      },
      ghost_text = { enabled = true },
      -- Don't select by default, auto insert on selection
      list = { selection = { preselect = false, auto_insert = false } },
      menu = {
        border = "rounded",
        draw = {
          -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          columns = { { "kind_icon", "label", gap = 1 }, { "kind" } },
      --     components = {
      --       kind_icon = {
      --         ellipsis = false,
      --         text = function(ctx)
      --           local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
      --           return kind_icon
      --         end,
      --         -- Optionally, you may also use the highlights from mini.icons
      --         highlight = function(ctx)
      --           local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
      --           return hl
      --         end,
      --       }
      --     }
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end,
              highlight = 'CmpItemKind'
              -- highlight = function(ctx)
              --   local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              --   return hl
              -- end,
            },
            label = {
              text = function(item)
                return item.label
              end,
              highlight = 'CmpItemAbbr'
            },
            kind = {
              text = function(item)
                return item.label
              end,
              highlight = 'CmpItemKind'
            }
          }
        }
      }
    },
    sources = {
      -- default = { "lsp", "path", "snippets", "buffer", "luasnip", "dadbod" },
      default = { "lsp", "path", "snippets", "buffer", "dadbod" },
      -- default = function(ctx)
      --   local success, node = pcall(vim.treesitter.get_node)
      --   if vim.bo.filetype == 'lua' then
      --     return { 'lsp', 'path' }
      --   elseif success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
      --     return { 'buffer' }
      --   else
      --     return { "lsp", "path", "snippets", "buffer", "luasnip", "dadbod" }
      --   end
      -- end,
      -- optionally disable cmdline completions
      -- cmdline = {},
      providers = {
      --   lsp = {
      --     name = "LSP",
      --     enabled = true,
      --     module = "blink.cmp.sources.lsp",
      --     -- kind = "LSP",
      --     -- fallbacks = { "snippets", "luasnip", "buffer" },
      --     fallbacks = { "snippets", "buffer" },
      --     score_offset = 90, -- the higher the number, the higer the priority
      --   },
      --   -- snippets = {
      --   --   -- name = "Luasnip",
      --   --   -- preset = "luasnip",
      --   --   enabled = true,
      --   --   -- module = "blink.cmp.sources.luasnip",
      --   --   min_keyword_length = 2,
      --   --   -- fallbacks = { "snippets" },
      --   --   score_offset = 85, -- the higher the number, the higer the priority
      --   -- },
      --   snippets = {
      --     name = "Snippets",
      --     enabled = true,
      --     min_keyword_length = 2,
      --     module = "blink.cmp.sources.snippets",
      --     score_offset = 80, -- the higher the number, the higer the priority
      --   },
      --   path = {
      --     name = "Path",
      --     module = "blink.cmp.sources.path",
      --     score_offset = 3,
      --     -- fallbacks = { "snippets", "luasnip", "buffer" },
      --     fallbacks = { "snippets", "buffer" },
      --     opts = {
      --       trailing_slash = false,
      --       label_trailing_slash = true,
      --       get_cwd = function(context)
      --         return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
      --       end,
      --       show_hidden_files_by_default = true,
      --     }
      --   },
      --   buffer = {
      --     name = "Buffer",
      --     module = "blink.cmp.sources.buffer",
      --     min_keyword_length = 2,
      --   },
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
          score_offset = 85, -- the higher the number, the higer the priority
        },
      },
    },

    -- experimental signature help support
    signature = {
      enabled = true,
      window = { border = "rounded" }
    },

    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    -- opts_extend = { "sources.default" }
    snippets = {
      expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require("luasnip").jumpable(filter.direction)
        end
        return require("luasnip").in_snippet()
      end,
      jump = function(direction)
        require("luasnip").jump(direction)
      end,
    }
  }
end

return M
