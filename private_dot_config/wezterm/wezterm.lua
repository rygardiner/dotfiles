-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Use bash v5
config.default_prog = { '/opt/homebrew/bin/bash' }

-- Disable the tab bar
config.enable_tab_bar = false

-- For example, changing the initial geometry for new windows:
config.initial_cols = 240
config.initial_rows = 56

-- or, changing the font size and color scheme.
config.font_size = 20
config.color_scheme = 'Tokyo Night'

-- Finally, return the configuration to wezterm:
return config
