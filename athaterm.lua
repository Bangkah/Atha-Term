-- AthaTerm Configuration
-- Custom WezTerm configuration with dark theme and neon green accent
-- Author: Custom Terminal Setup
-- Version: 1.0.0

local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ============================================================================
-- BRANDING & APPEARANCE
-- ============================================================================

-- Window title and branding
config.window_frame = {
  font = wezterm.font { family = 'Fira Code', weight = 'Bold' },
  font_size = 11.0,
  active_titlebar_bg = '#0a0a0a',
  inactive_titlebar_bg = '#0a0a0a',
}

-- Custom title for tabs
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = 'AthaTerm'
  if tab.active_pane.title and tab.active_pane.title ~= '' then
    title = tab.active_pane.title
  end

  local index = tab.tab_index + 1
  return {
    { Text = ' ' .. index .. ': ' .. title .. ' ' },
  }
end)

-- ============================================================================
-- COLORS & THEME (Dark with Neon Green Accent)
-- ============================================================================

config.color_scheme = 'Custom'
config.colors = {
  -- Base colors
  foreground = '#00ff00',  -- Neon green text
  background = '#0a0a0a',  -- Very dark background
  cursor_bg = '#00ff00',   -- Neon green cursor
  cursor_fg = '#0a0a0a',   -- Dark cursor text
  cursor_border = '#00ff00',

  selection_fg = '#0a0a0a',
  selection_bg = '#33ff33',

  scrollbar_thumb = '#1a1a1a',
  split = '#00ff00',

  -- ANSI colors
  ansi = {
    '#1a1a1a',  -- black
    '#ff3333',  -- red
    '#00ff00',  -- green (neon)
    '#ffff00',  -- yellow
    '#3333ff',  -- blue
    '#ff33ff',  -- magenta
    '#00ffff',  -- cyan
    '#cccccc',  -- white
  },

  brights = {
    '#666666',  -- bright black
    '#ff6666',  -- bright red
    '#66ff66',  -- bright green (neon)
    '#ffff66',  -- bright yellow
    '#6666ff',  -- bright blue
    '#ff66ff',  -- bright magenta
    '#66ffff',  -- bright cyan
    '#ffffff',  -- bright white
  },

  -- Tab bar colors
  tab_bar = {
    background = '#0a0a0a',
    active_tab = {
      bg_color = '#1a1a1a',
      fg_color = '#00ff00',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#0a0a0a',
      fg_color = '#666666',
    },
    inactive_tab_hover = {
      bg_color = '#1a1a1a',
      fg_color = '#00ff00',
    },
    new_tab = {
      bg_color = '#0a0a0a',
      fg_color = '#00ff00',
    },
    new_tab_hover = {
      bg_color = '#1a1a1a',
      fg_color = '#66ff66',
    },
  },
}

-- ============================================================================
-- FONT CONFIGURATION
-- ============================================================================

config.font = wezterm.font_with_fallback {
  {
    family = 'Fira Code',
    weight = 'Regular',
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }, -- Enable ligatures
  },
  'JetBrains Mono',
  'Cascadia Code',
  'monospace',
}

config.font_size = 11.0
config.line_height = 1.2
config.cell_width = 1.0

-- Enable font shaping for ligatures
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

-- ============================================================================
-- SHELL CONFIGURATION
-- ============================================================================

config.default_prog = { '/bin/bash' }

-- ============================================================================
-- WINDOW SETTINGS
-- ============================================================================

config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.95
config.text_background_opacity = 1.0
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

config.enable_scroll_bar = true
config.scrollback_lines = 10000

-- Initial window size
config.initial_cols = 120
config.initial_rows = 30

-- ============================================================================
-- TAB BAR SETTINGS
-- ============================================================================

config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.tab_max_width = 32

-- ============================================================================
-- KEYBINDINGS (Custom AthaTerm Shortcuts)
-- ============================================================================

config.keys = {
  -- Tab management
  {
    key = 'T',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'W',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'Tab',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'Tab',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },

  -- Pane splitting
  {
    key = 'H',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'V',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Pane navigation
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },

  -- Pane resizing
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },

  -- Close pane
  {
    key = 'Q',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- Copy/Paste
  {
    key = 'C',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'V',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PasteFrom 'Clipboard',
  },

  -- Font size adjustment
  {
    key = '+',
    mods = 'CTRL',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.DecreaseFontSize,
  },
  {
    key = '0',
    mods = 'CTRL',
    action = wezterm.action.ResetFontSize,
  },

  -- Search
  {
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.Search 'CurrentSelectionOrEmptyString',
  },

  -- Toggle fullscreen
  {
    key = 'F11',
    mods = 'NONE',
    action = wezterm.action.ToggleFullScreen,
  },

  -- Reload configuration
  {
    key = 'R',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },
}

-- ============================================================================
-- MOUSE BINDINGS
-- ============================================================================

config.mouse_bindings = {
  -- Right click paste
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
  },

  -- Ctrl+Click to open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- ============================================================================
-- PERFORMANCE & MISC
-- ============================================================================

config.enable_kitty_graphics = false
config.animation_fps = 60
config.max_fps = 60
config.front_end = 'OpenGL'
config.webgpu_power_preference = 'HighPerformance'

-- Automatically reload configuration on change
config.automatically_reload_config = true

-- Visual bell
config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 150,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 150,
}

config.audible_bell = 'Disabled'

-- Hyperlink rules
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Additional URL patterns
table.insert(config.hyperlink_rules, {
  regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
  format = '$0',
})

-- ============================================================================
-- STARTUP MESSAGE (Optional)
-- ============================================================================

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
