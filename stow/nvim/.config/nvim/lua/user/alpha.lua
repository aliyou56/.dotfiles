local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
local icons = require("user.icons")

local function button(sc, txt, keybind, keybind_opt)
	local b = dashboard.button(sc, txt, keybind, keybind_opt)
	b.opts.hl_shortcut = "Macro"
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
	button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
	button("e", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
	button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
	button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
	button("t", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
	button("s", icons.ui.SignIn .. " Find Session", ":Telescope persisted<CR>"),
	button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
	button("u", icons.ui.CloudDownload .. " Update", ":PackerSync<CR>"),
	button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
}

local function footer()
	return "aliyou"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
