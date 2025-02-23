local M = {
  "goolord/alpha-nvim",
}

function M.config()
  local dashboard = require "alpha.themes.dashboard"
  local icons = require "user.icons"

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Boolean"
    return b
  end

  dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  }

  dashboard.section.buttons.val = {
    -- button("f", icons.ui.Files .. "  Find file", ":Telescope find_files <CR>"),
    button("f", icons.ui.Files .. "  Find file", ":FzfLua files <CR>"),
    button("n", icons.ui.NewFile .. "  New file", ":ene <BAR> startinsert <CR>"),
    -- button("s", icons.ui.SignIn .. " Load session", ":Telescope persisted<CR>"),
    -- button("s", icons.ui.SignIn .. " Load session", ":lua require('persistence').load()<CR>"),
    -- button("p", icons.git.Repo .. "  Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    -- button("p", icons.git.Repo .. "  Find project", ":lua require('user.project').OpenRecentProject()<CR>"),
    -- button("r", icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
    button("r", icons.ui.History .. "  Recent files", ":FzfLua oldfiles <CR>"),
    -- button("t", icons.ui.Text .. "  Find text", ":Telescope live_grep <CR>"),
    button("t", icons.ui.Text .. "  Find text", ":FzfLua live_grep <CR>"),
    button("c", icons.ui.Gear .. "  Config", ":e ~/.config/nvim/init.lua <CR>"),
    button("q", icons.ui.SignOut .. "  Quit", ":qa<CR>"),
  }
  local function footer()
    return "aliyou"
  end

  dashboard.section.footer.val = footer()

  dashboard.section.header.opts.hl = "Function"
  dashboard.section.buttons.opts.hl = "Boolean"
  dashboard.section.footer.opts.hl = "@keyword.return"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
        set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
        set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
      ]]
    end,
  })
end

return M
