-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()

-- Theme: Rosé Pine Dawn
config.color_scheme = 'rose-pine-dawn'

-- Soft opacity — Dawn is a light theme so 0.92 keeps it airy without washing out
config.window_background_opacity = 0.92

-- Font — Maple Mono
config.font = wezterm.font('Maple Mono NF', { italic = true })
config.font_size = 20

-- Shell
config.default_prog = { '/usr/local/bin/pwsh' }

-- Layout — keeping your geometry
config.initial_cols = 240
config.initial_rows = 56

-- Tab bar off
config.enable_tab_bar = false

-- Soft padding so text doesn't press the edges
config.window_padding = {
  left = 16,
  right = 16,
  top = 12,
  bottom = 12,
}

-- disable top OS bar
config.window_decorations = "RESIZE"


return config
