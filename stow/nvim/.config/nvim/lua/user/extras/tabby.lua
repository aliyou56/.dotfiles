local M = {
  "nanozuki/tabby.nvim",
  event = "VeryLazy",
  dependencies = { "echasnovski/mini.icons" },
}

M.config = function()
  local api = require "tabby.module.api"

  local cp = { -- Catppuccin Mocha palette
    base    = "#1e1e2e",
    mantle  = "#181825",
    surface0 = "#313244",
    surface1 = "#45475a",
    overlay1 = "#7f849c",
    text    = "#cdd6f4",
    subtext1 = "#bac2de",
    mauve   = "#cba6f7",
    lavender = "#b4befe",
    peach   = "#fab387",
  }
  local theme = {
    fill        = { bg = cp.mantle },
    head        = { fg = cp.mantle,  bg = cp.mauve,   style = "bold" },
    current_tab = { fg = cp.text,    bg = cp.surface0, style = "bold" },
    tab         = { fg = cp.subtext1, bg = cp.mantle },
    win         = { fg = cp.overlay1, bg = cp.mantle },
    tail        = { fg = cp.mantle,  bg = cp.lavender, style = "bold" },
    modified    = { fg = cp.peach,   bg = cp.surface0 },
  }
  -- local theme = {
  --   fill = "TabLineFill",
  --   head = "TabLine",
  --   current_tab = "TabLineSel",
  --   tab = "TabLine",
  --   win = "TabLine",
  --   tail = "TabLine",
  -- }

  -- display name for the active window of a tab
  local function tab_name(tab)
    local cur_win = api.get_tab_current_win(tab.id)
    if api.is_float_win(cur_win) then return "  Float" end

    local bufnr    = vim.fn.getwininfo(cur_win)[1].bufnr
    local bufinfo  = vim.fn.getbufinfo(bufnr)[1]
    local fullpath = bufinfo.name
    local fname    = vim.fn.fnamemodify(fullpath, ":t")

    -- special buffers
    -- if fname:find("NvimTree")     then return " 󰙅 Explorer" end
    -- if fname == "snacks_explorer" then return " 󰙅 Explorer" end
    -- if fname == "NeogitStatus"    then return "  Neogit"    end
    -- if fname == "neo-tree"        then return " 󰙅 Neo-tree" end
    if fname == ""                then return "  Empty"     end

    local icon = require("mini.icons").get("file", fname)

    -- prefix with project dir when multiple tabs are open
    if #vim.api.nvim_list_tabpages() > 1 then
      local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return icon .. " " .. project .. ":" .. fname
    end

    return icon .. " " .. fname
  end

  local function change_mark(tab)
    for _, win in ipairs(api.get_tab_wins(tab.id)) do
      local bufnr   = vim.fn.getwininfo(win)[1].bufnr
      local bufinfo = vim.fn.getbufinfo(bufnr)[1]
      if bufinfo.changed == 1 then return " 󰏫 " end
    end
    return "  "
  end

  local function win_count(tab)
    local n = #api.get_tab_wins(tab.id)
    return n > 1 and ("󱂬 " .. n .. " ") or ""
  end

  local function tab_counter()
    local total = #vim.api.nvim_list_tabpages()
    if total < 2 then return nil end
    local current = vim.api.nvim_tabpage_get_number(0)
    return current .. "/" .. total
  end

  require("tabby.tabline").set(function(line)
    return {
      -- head: logo + tab counter
      {
        { "  󰓩  ", hl = theme.head },
        { tab_counter() and (tab_counter() .. " ") or "", hl = theme.head },
        line.sep("", theme.head, theme.fill),
      },

      -- tabs
      line.tabs().foreach(function(tab)
        local hl  = tab.is_current() and theme.current_tab or theme.tab
        local sep_hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep("", sep_hl, theme.fill),
          { change_mark(tab), hl = tab.is_current() and theme.modified or theme.tab },
          { tab_name(tab),    hl = hl },
          { win_count(tab),   hl = theme.win },
          -- { tab.close_btn(" 󰅖 "), hl = theme.tab },
          line.sep("", sep_hl, theme.fill),
          hl     = hl,
          margin = " ",
        }
      end),

      -- tail: current working directory
      -- {
      --   line.sep("", theme.tail, theme.fill),
      --   { "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. "  ", hl = theme.tail },
      -- },

      hl = theme.fill,
    }
  end, {
    buf_name = { mode = "unique" },
  })
end

return M

--   vim.keymap.set("n", "<leader>di", function()
--   local bufnr  = vim.fn.winbufnr(0)
--   local ft     = vim.bo[bufnr].filetype
--   local bt     = vim.bo[bufnr].buftype
--   local fname  = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
--   vim.notify(
--     "ft: "     .. ft    .. "\n" ..
--     "buftype: " .. bt   .. "\n" ..
--     "fname: "   .. fname,
--     vim.log.levels.INFO
--   )
-- end, { desc = "debug: inspect current buffer" })

-- -- local theme = {
-- --   fill = "TabLineFill",
-- --   head = "TabLine",
-- --   current_tab = "TabLineSel",
-- --   tab = "TabLine",
-- --   win = "TabLine",
-- --   tail = "TabLine",
-- -- }
--
-- local open_tabs = {}
--
-- -- local tab_name = function(tab)
-- --   local api = require "tabby.module.api"
-- --   local cur_win = api.get_tab_current_win(tab.id)
-- --   if api.is_float_win(cur_win) then
-- --     return "[Floating]"
-- --   end
-- --   local current_bufnr = vim.fn.getwininfo(cur_win)[1].bufnr
-- --   local current_bufinfo = vim.fn.getbufinfo(current_bufnr)[1]
-- --   local current_buf_name = vim.fn.fnamemodify(current_bufinfo.name, ":t")
-- --   -- local no_extension = vim.fn.fnamemodify(current_bufinfo.name, ":p:r")
-- --
-- --   if string.find(current_buf_name, "NvimTree") ~= nil then
-- --     return "[File Explorer]"
-- --   end
-- --
-- --   if current_buf_name == "NeogitStatus" then
-- --     return "[Neogit]"
-- --   end
-- --
-- --   if open_tabs[current_bufinfo.name] == nil then
-- --     local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- --     open_tabs[current_bufinfo.name] = project_name
-- --   end
-- --
-- --   if current_buf_name == "" then
-- --     return "[Empty]"
-- --   else
-- --     if open_tabs[current_bufinfo.name] == nil then
-- --       return current_buf_name
-- --     end
-- --
-- --     return open_tabs[current_bufinfo.name] .. ":" .. current_buf_name
-- --   end
-- -- end
--
-- local tab_count = function()
--   local num_tabs = #vim.api.nvim_list_tabpages()
--
--   if num_tabs > 1 then
--     local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
--     return tabpage_number .. "/" .. tostring(num_tabs)
--   end
-- end
--
-- local change_mark = function(tab)
--   local already_marked = false
--   return tab.wins().foreach(function(win)
--     local bufnr = vim.fn.getwininfo(win.id)[1].bufnr
--     local bufinfo = vim.fn.getbufinfo(bufnr)[1]
--     if not already_marked and bufinfo.changed == 1 then
--       already_marked = true
--       return " "
--     else
--       return ""
--     end
--   end)
-- end
--
-- local window_count = function(tab)
--   local api = require "tabby.module.api"
--   local win_count = #api.get_tab_wins(tab.id)
--   if win_count == 1 then
--     return ""
--   else
--     return "[" .. win_count .. "]"
--   end
-- end
--
-- return {
--   "nanozuki/tabby.nvim",
--   event = "VeryLazy",
--   config = function()
--     require("tabby.tabline").set(function(line)
--       return {
--         {
--           { " 󰓩  ", hl = theme.head },
--           { tab_count(), hl = theme.head },
--           -- line.sep(" ", theme.head, theme.fill),
--           line.sep(" ", theme.head, theme.fill),
--         },
--         line.tabs().foreach(function(tab)
--           local hl = tab.is_current() and theme.current_tab or theme.tab
--           return {
--             -- line.sep("", hl, theme.fill),
--             line.sep("", hl, theme.fill),
--             tab.is_current() and "" or "",
--             tab_name(tab),
--             -- tab.close_btn("󰅖 "),
--             -- window_count(tab),
--             -- change_mark(tab),
--             -- line.sep(" ", hl, theme.fill),
--             line.sep(" ", hl, theme.fill),
--             hl = hl,
--             margin = " ",
--           }
--         end),
--         hl = theme.fill,
--       }
--     end, {
--       buf_name = {
--         mode = "unique",
--       },
--     })
--   end,
-- }
