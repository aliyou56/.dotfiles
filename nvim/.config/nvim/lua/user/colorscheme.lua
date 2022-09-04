-- local colorscheme = "material"
local colorscheme = "kanagawa"
-- local colorscheme = "darkplus"
-- local colorscheme = "tokyonight"
-- local colorscheme = "ondark"
-- local colorscheme = "onedarker"
-- local colorscheme = "gruvbox"
-- local colorscheme = "nightfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

