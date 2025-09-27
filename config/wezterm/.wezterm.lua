-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.front_end = 'OpenGL'
config.freetype_load_flags = 'NO_HINTING'
config.freetype_load_target = "HorizontalLcd"
-- config.color_scheme = 'Solarized Darcula'
-- config.color_scheme = 'Catppuccin Frappe'
config.color_scheme = 'OneHalfDark'

config.keys = {
    {key="RightArrow", mods="ALT", action=wezterm.action{SendString="\x1b[B"}},
    {key="LeftArrow", mods="ALT", action=wezterm.action{SendString="\x1b[D"}},
}

-- Finally, return the configuration to wezterm:
return config
