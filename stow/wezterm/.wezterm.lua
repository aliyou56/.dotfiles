local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

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
config.use_fancy_tab_bar = false
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.integrated_title_button_style = 'Gnome'
config.window_frame = {
  -- font = wezterm.font { family = 'CaskaydiaCove Nerd Font', weight = 'Bold' },
  font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
  font_size = 12,
  active_titlebar_bg = TITLEBAR_COLOR,
  inactive_titlebar_bg = TITLEBAR_COLOR,
  -- border_left_width = '0.5cell',
  -- border_right_width = '0.5cell',
  -- border_bottom_height = '0.25cell',
  -- border_top_height = '0.25cell',
  -- border_left_color = 'purple',
  -- border_right_color = 'purple',
  -- border_bottom_color = 'purple',
  -- border_top_color = 'purple',
}
config.window_padding = {
  top = 0,
  bottom = 0,
}
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7
}

config.disable_default_key_bindings = true

-- config.leader = { key = 'Space', mods = 'CTRL|SHIFT' }
-- config.leader = { key = "SHIFT", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
--   { action = wezterm.action.Nop                   , mods =        'ALT', key = 'Enter' },
  { key = 'P',     mods = 'CTRL|SHIFT', action = act.ActivateCommandPalette },
  { key = 'N',     mods = 'CTRL|SHIFT', action = act.SpawnWindow, },
  { key = 'T',     mods = 'CTRL|SHIFT', action = act.SpawnTab 'DefaultDomain', },
  -- { key = 'T',     mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain', },
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

  { key = 'Enter', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'Space',     mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
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
--
--   -- Floating panes (not implemented yet)
--     -- bind "Alt w" { ToggleFloatingPanes; }
--     -- bind "Alt e" { TogglePaneEmbedOrFloating; }
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
--   -- line_height = 1.2,
--   unicode_version = 15,

-- Switch between just an opacity and a background image based on whether we are fullscreen
function set_background(config, is_fullscreen)
  if is_fullscreen then
    config.window_background_opacity = nil
    config.background = {
      {
        source = {
          File = wezterm.home_dir .. '/.dotfiles/images/background.jpg',
          -- File = wezterm.home_dir .. '/work/github/.dotfiles/images/forrest.png',
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
    config.window_background_opacity = 0.85
    config.background = nil
  end
end

wezterm.on('window-resized', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local is_fullscreen = window:get_dimensions().is_full_screen
  set_background(overrides, is_fullscreen)
  window:set_config_overrides(overrides)
end)

wezterm.on('update-status', function(window, pane)
  local cells = {}

  -- Figure out the hostname of the pane on a best-effort basis
  local hostname = wezterm.hostname()
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri and cwd_uri.host then
    hostname = cwd_uri.host
  end
  table.insert(cells, '  ' .. hostname)

  -- Format date/time in this style: "Wed Mar 3 08:14"
  local date = wezterm.strftime ' %a %b %-d %H:%M'
  table.insert(cells, date)

  -- -- Add an entry for each battery (typically 0 or 1)
  -- local batt_icons = {'', '', '', '', ''}
  -- for _, b in ipairs(wezterm.battery_info()) do
  --   local curr_batt_icon = batt_icons[math.ceil(b.state_of_charge * #batt_icons)]
  --   table.insert(cells, string.format('%s %.0f%%', curr_batt_icon, b.state_of_charge * 100))
  -- end

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

-- wezterm.on("update-right-status", function(window, pane)
--   local stat = window:active_workspace()
--   if window:active_key_table() then stat = window:active_key_table() end
--   if window:leader_is_active() then stat = "leader" end
--   local basename = function(s)
--     return string.gsub(s, "(.*[/\\])(.*)", "%2")
--   end
--   local cwd = basename(pane:get_current_working_dir())
--   local cmd = basename(pane:get_foreground_process_name())
--   local time = wezterm.strftime("%H:%M")
--
--   window:set_right_status(wezterm.format({
--     { Text = wezterm.nerdfonts.oct_table .. " " .. stat },
--     { Text = " | "},
--     { Text = wezterm.nerdfonts.md_folder .. " " .. cwd },
--     { Text = " | "},
--     { Foreground = { Color = "FFB86C" } },
--     { Text = wezterm.nerdfonts.fa_code .. " " .. cmd },
--     "ResetAttributes",
--     { Text = " | "},
--     { Text = wezterm.nerdfonts.md_clock .. " " .. time },
--   }))
-- end)

-- -- wezterm.on("gui-startup", function(cmd)
-- --   local _, _, window = wezterm.mux.spawn_window(cmd or {})
-- --   window:gui_window():toggle_fullscreen()
-- -- end)

-- -- this is called by the mux server when it starts up.
-- -- It makes a window split top/bottom
-- -- wezterm.on('mux-startup', function()
-- --   local tab, pane, window = mux.spawn_window {}
-- --   pane:split { direction = 'Top' }
-- -- end)

return config

-- return {
--   audible_bell = 'Disabled',
--   window_background_opacity = 0.9,

--
--   keys = {
--     { key = 'w', mods = 'CTRL|SHIFT', action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },
--   },


