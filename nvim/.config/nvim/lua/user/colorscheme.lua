-- local colorscheme = "darkplus"
local colorscheme = "onlight"
-- local colorscheme = "tokyonight"
-- local colorscheme = "onedarker"
-- local colorscheme = "kanagawa"
-- local colorscheme = "gruvbox"
-- local colorscheme = "ondark"
-- local colorscheme = "nightfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
