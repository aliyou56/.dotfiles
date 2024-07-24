local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

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

return {
  window_decorations = "RESIZE",
  adjust_window_size_when_changing_font_size = false,
  audible_bell = 'Disabled',
  -- window_background_image = "/home/aliyou/work/github/.dotfiles/images/forrest.png",
  window_background_opacity = 0.9,
  -- color_scheme = 'Catppuccin Frappe',
  color_scheme = 'Kanagawa (Gogh)',
  disable_default_key_bindings = true,
  exit_behavior = 'Close',
  font = wezterm.font_with_fallback({
    {
      family = 'CaskaydiaCove Nerd Font',
      -- scale = 1.2,
      weight = 'DemiBold',
      stretch = 'Normal',
      style = 'Normal',
      -- harfbuzz_features = { 'cv29', 'cv30', 'ss01', 'ss03', 'ss06', 'ss07', 'ss09' },
    },
  }),
  font_size = 11,
  -- line_height = 1.2,
  -- force_reverse_video_cursor = true,
  hide_mouse_cursor_when_typing = true,
  -- hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  scrollback_lines = 10000,
  show_update_window = true,
  use_dead_keys = false,
  unicode_version = 15,
  -- window_close_confirmation = 'NeverPrompt',

  -- Keys
  -- leader = { key = "SHIFT", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    { action = act.ActivateCommandPalette,                           mods = 'CTRL|SHIFT',     key = 'P' },
    { action = act.SpawnWindow,                                      mods = 'CTRL|SHIFT',     key = 'N' },
    { action = act.SpawnTab 'DefaultDomain',                         mods = 'CTRL|SHIFT',     key = 'T' },
    -- { action = act.SpawnTab  'CurrentPaneDomain'      , mods = 'SHIFT|ALT',  key = 'T' },
    { action = act.CopyTo 'Clipboard',                               mods = 'CTRL|SHIFT',     key = 'C' },
    { action = act.PasteFrom 'Clipboard',                            mods = 'CTRL|SHIFT',     key = 'V' },
    { action = act.TogglePaneZoomState,                              mods = 'CTRL|SHIFT',     key = 'Z' },
    { action = wezterm.action.DecreaseFontSize,                      mods = 'CTRL',           key = '-' },
    { action = wezterm.action.IncreaseFontSize,                      mods = 'CTRL',           key = '=' },
    --   { action = wezterm.action.Nop                   , mods =        'ALT', key = 'Enter' },
    { action = wezterm.action.ResetFontSize,                         mods = 'CTRL',           key = '0' },
    { action = wezterm.action.ToggleFullScreen,                      key = 'F11' },

    -- { action = wezterm.action.Search      , mods = 'CTRL|SHIFT', key =   'F' },

    { action = act.ActivatePaneDirection 'Up',                       mods = 'CTRL|SHIFT',  key = 'k' },
    { action = act.ActivatePaneDirection 'Down',                     mods = 'CTRL|SHIFT',  key = 'j' },
    { action = act.ActivatePaneDirection 'Left',                     mods = 'CTRL|SHIFT',  key = 'h' },
    { action = act.ActivatePaneDirection 'Right',                    mods = 'CTRL|SHIFT',  key = 'l' },

    { action = act.ActivateTabRelative(-1),                          mods = 'CTRL|SHIFT',  key = 'LeftArrow' },
    { action = act.ActivateTabRelative(1),                           mods = 'CTRL|SHIFT',  key = 'RightArrow' },

    { action = act.SplitVertical { domain = 'CurrentPaneDomain' },   mods = 'CTRL|SHIFT',  key = '_' },
    { action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, mods = 'CTRL|SHIFT',  key = '|' },
    { action = act.RotatePanes 'CounterClockwise',                   mods = 'ALT|SHIFT',  key = 'L' },

    { action = act.CloseCurrentTab { confirm = false },              mods = 'CTRL|SHIFT',  key = 'Q' },
    { action = act.CloseCurrentPane { confirm = false },             mods = 'CTRL|SHIFT',  key = 'X' },

    { key = 'PageUp',                                                mods = 'CTRL|SHIFT',  action = act.ScrollByPage(-1) },
    { key = 'PageDown',                                              mods = 'CTRL|SHIFT',  action = act.ScrollByPage(1) },

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

    -- CTRL+SHIFT+Space, followed by 'a' will put us in activate-pane
    -- mode until we press some other key or until 1 second (1000ms)
    -- of time elapses
    -- {
    --   key = 'a',
    --   mods = 'CTRL|SHIFT',
    --   action = act.ActivateKeyTable {
    --     name = 'activate_pane',
    --     timeout_milliseconds = 1000,
    --   },
    -- },

    { key = 'w', mods = 'CTRL|SHIFT', action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },
  },

  key_tables = {
    resize_pane = {
      { key = 'j',      action = act.AdjustPaneSize { 'Down', 1 } },
      { key = 'h',      action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'k',      action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'l',      action = act.AdjustPaneSize { 'Right', 1 } },
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
  },


  status_update_interval = 1000,
  wezterm.on("update-right-status", function(window, pane)
    local stat = window:active_workspace()
    if window:active_key_table() then stat = window:active_key_table() end
    if window:leader_is_active() then stat = "leader" end
    local basename = function(s)
      return string.gsub(s, "(.*[/\\])(.*)", "%2")
    end
    local cwd = basename(pane:get_current_working_dir())
    local cmd = basename(pane:get_foreground_process_name())
    local time = wezterm.strftime("%H:%M")

    window:set_right_status(wezterm.format({
      { Text = wezterm.nerdfonts.oct_table .. " " .. stat },
      { Text = " | "},
      { Text = wezterm.nerdfonts.md_folder .. " " .. cwd },
      { Text = " | "},
      { Foreground = { Color = "FFB86C" } },
      { Text = wezterm.nerdfonts.fa_code .. " " .. cmd },
      "ResetAttributes",
      { Text = " | "},
      { Text = wezterm.nerdfonts.md_clock .. " " .. time },
    }))
  end),

  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7
  },
  window_frame = {
    font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
  },
  window_padding = {
    top = 0,
    bottom = 0,
  },
}
