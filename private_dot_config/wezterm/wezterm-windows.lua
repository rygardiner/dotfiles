-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Use bash v5
config.default_prog = { 'wsl.exe', '--distribution', 'Ubuntu', '--exec', 'bash', '-l' }

-- Star in the home directory when opening a new window
config.default_cwd = '~'

-- Disable the tab bar
config.enable_tab_bar = false

-- For example, changing the initial geometry for new windows:
config.initial_cols = 230
config.initial_rows = 50

-- or, changing the font size and color scheme.
config.font_size = 20
config.color_scheme = 'Tokyo Night'

-- Finally, return the configuration to wezterm:
return config
