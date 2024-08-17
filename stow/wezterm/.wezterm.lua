local wezterm = require 'wezterm'
local act = wezterm.action
-- local mux = wezterm.mux

-- require 'scrollback'

local config = wezterm.config_builder()
config:set_strict_mode(true)

config.font = wezterm.font 'CaskaydiaCove Nerd Font'
config.font_size = 12
-- config.color_scheme = 'Catppuccin Mocha (Gogh)'
-- config.color_scheme = 'Catppuccin Frappe'
config.color_scheme = 'Kanagawa (Gogh)'

local TITLEBAR_COLOR = '#333333'
-- config.native_macos_fullscreen_mode = true
-- config.use_fancy_tab_bar = false
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
-- config.integrated_title_button_style = 'Gnome'
config.window_frame = {
  font = wezterm.font { family = 'CaskaydiaCove Nerd Font', weight = 'Bold' },
  font_size = 11,
  active_titlebar_bg = TITLEBAR_COLOR,
  -- inactive_titlebar_bg = TITLEBAR_COLOR,

  -- inactive_titlebar_fg = '#cccccc',
  -- active_titlebar_fg = '#ffffff',
}
config.window_padding = {
  top = 0,
  bottom = 0,
}
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7
}

-- config.audible_bell = 'Disabled'
config.window_background_opacity = 0.9

config.disable_default_key_bindings = true

-- config.leader = { key = 'Space', mods = 'CTRL|SHIFT' }
-- config.leader = { key = "SHIFT", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
--   { action = wezterm.action.Nop                   , mods =        'ALT', key = 'Enter' },
  { key = 'P',     mods = 'CTRL|SHIFT', action = act.ActivateCommandPalette },
  { key = 'N',     mods = 'CTRL|SHIFT', action = act.SpawnWindow, },
  { key = 'T',     mods = 'CTRL|SHIFT', action = act.SpawnTab 'DefaultDomain', },
  { key = 'C',     mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard', },
  { key = 'V',     mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard', },
  { key = 'Z',     mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState, },
  { key = 'F',     mods = 'CTRL|SHIFT', action = act.Search { CaseSensitiveString = "" }, },
--     -- { action = wezterm.action.Search      , mods = 'CTRL|SHIFT', key =   'F' },
  { key = 'Q',     mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = false }, },
  { key = 'W',     mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = false }, },

  { key = '-',     mods = 'CTRL',       action = act.DecreaseFontSize, },
  { key = '+',     mods = 'CTRL',       action = act.IncreaseFontSize, },
  { key = '=',     mods = 'CTRL',       action = act.ResetFontSize, },

  { key = 'K',     mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up', },
  { key = 'J',     mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down', },
  { key = 'H',     mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left', },
  { key = 'L',     mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right', },

  -- { key = 'H', mods = 'SHIFT|ALT', action = act.AdjustPaneSize {'Left', 4}, },
  -- { key = 'L', mods = 'SHIFT|ALT', action = act.AdjustPaneSize {'Right', 4}, },
  -- { key = 'J', mods = 'SHIFT|ALT', action = act.AdjustPaneSize {'Down', 4}, },
  -- { key = 'K', mods = 'SHIFT|ALT', action = act.AdjustPaneSize {'Up', 4}, },

  { key = 'LeftArrow',  mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1), },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1), },
  { key = '<',          mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1), },
  { key = '>',          mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1), },

  { key = 'Enter', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'Space', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'M',     mods = 'CTRL|SHIFT', action = act.RotatePanes 'CounterClockwise', },

  { key = 'PageUp',   mods = 'CTRL|SHIFT', action = act.ScrollByPage(-1), },
  { key = 'PageDown', mods = 'CTRL|SHIFT', action = act.ScrollByPage(1), },

  { key = 'Enter', mods = 'ALT',        action = act.ToggleFullScreen, },
  { key = 'D',     mods = 'CTRL|SHIFT', action = act.ShowDebugOverlay, },
  { key = 'S',     mods = 'CTRL|SHIFT', action = act.QuickSelect, },
  { key = 'w',     mods = 'ALT|SHIFT', action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },

  {
    key = 'r',
    mods = 'CTRL|SHIFT',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },
  {
    key = 'm',
    mods = 'CTRL|SHIFT',
    action = act.ActivateKeyTable {
      name = 'move_tab',
      one_shot = false,
    },
  },


--   { key = '[', mods = 'ALT', action = act.ActivateTabRelative(-1), },
--   { key = ']', mods = 'ALT', action = act.ActivateTabRelative(1), },
--     -- bind "Alt b" { MovePaneBackwards; }
}

config.key_tables = {
  resize_pane = {
    { key = 'j',      action = act.AdjustPaneSize { 'Down', 4 } },
    { key = 'h',      action = act.AdjustPaneSize { 'Left', 4 } },
    { key = 'k',      action = act.AdjustPaneSize { 'Up', 4 } },
    { key = 'l',      action = act.AdjustPaneSize { 'Right', 4 } },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'Enter',  action = 'PopKeyTable' },
  },

  move_tab = {
    { key = 'h',      action = act.MoveTabRelative(-1) },
    { key = 'j',      action = act.MoveTabRelative(-1) },
    { key = 'k',      action = act.MoveTabRelative(1) },
    { key = 'l',      action = act.MoveTabRelative(1) },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'Enter',  action = 'PopKeyTable' },
  },
}

--   config.scrollback_lines = 10000,

-- Switch between just an opacity and a background image based on whether we are fullscreen
local function set_background(config, is_fullscreen)
  local dotfiles = '/work/github/.dotfiles'
  if is_fullscreen then
    config.window_background_opacity = nil
    config.background = {
      {
        source = {
          File = wezterm.home_dir .. dotfiles .. '/images/background.jpg',
          -- File = wezterm.home_dir .. dotfiles .. '/images/forrest.png',
        },
        attachment = { Parallax = 0.1 },
        repeat_y = 'Mirror',
        horizontal_align = 'Center',
        opacity = 0.4,
        hsb = {
          hue = 1.0,
          saturation = 0.95,
          brightness = 0.5,
        },
      },
    }
  else
    config.window_background_opacity = 0.9
    config.background = nil
  end
end

-- wezterm.on('window-resized', function(window, _) -- pane
--   local overrides = window:get_config_overrides() or {}
--   local is_fullscreen = window:get_dimensions().is_full_screen
--   set_background(overrides, is_fullscreen)
--   window:set_config_overrides(overrides)
-- end)

local function get_ram_usage()
  local _, result, _ = wezterm.run_child_process {
    'bash', '-c',
    "free | grep Mem | awk '{printf \"%d\", $3/$2 * 100.0}'"
  }
  return tonumber(result) or 0
end

wezterm.on('update-status', function(window, pane)
  local cells = {}

  -- Figure out the hostname of the pane on a best-effort basis
  local hostname = wezterm.hostname()
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri and cwd_uri.host then
    hostname = cwd_uri.host
  end
  table.insert(cells, wezterm.nerdfonts.md_laptop .. "  " .. hostname)

  local basename = function(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  local cmd = basename(pane:get_foreground_process_name())
  table.insert(cells, wezterm.nerdfonts.fa_code .. "  " .. cmd)

  local ram_usage = string.format("%d%%", get_ram_usage())
  table.insert(cells, wezterm.nerdfonts.md_memory .. " " .. ram_usage)

  local time = wezterm.strftime("%H:%M")
  table.insert(cells, wezterm.nerdfonts.md_clock .. " " .. time)

  local batt_icons = {' ', ' ', ' ', ' ', ' '}
  for _, b in ipairs(wezterm.battery_info()) do
    local curr_batt_icon = batt_icons[math.ceil(b.state_of_charge * #batt_icons)]
    table.insert(cells, string.format('%s %.0f%%', curr_batt_icon, b.state_of_charge * 100))
  end

  -- Color palette for each cell
  local text_fg = '#c0c0c0'
  local colors = {
    TITLEBAR_COLOR,
    '#3c1361',
    '#52307c',
    '#663a82',
    '#7c5295',
    '#b491c8',
  }

  local elements = {}
  while #cells > 0 and #colors > 1 do
    local text = table.remove(cells, 1)
    local prev_color = table.remove(colors, 1)
    local curr_color = colors[1]

    table.insert(elements, { Background = { Color = prev_color } })
    table.insert(elements, { Foreground = { Color = curr_color } })
    table.insert(elements, { Text = '' })
    table.insert(elements, { Background = { Color = curr_color } })
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
  end
  window:set_right_status(wezterm.format(elements))
end)

-- wezterm.on("gui-startup", function(cmd)
--   local _, _, window = wezterm.mux.spawn_window(cmd or {})
--   window:gui_window():toggle_fullscreen()
-- end)

-- this is called by the mux server when it starts up.
-- It makes a window split top/bottom
-- wezterm.on('mux-startup', function()
--   local tab, pane, window = mux.spawn_window {}
--   pane:split { direction = 'Top' }
-- end)

return config
