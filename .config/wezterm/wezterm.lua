local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", italic = false }),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	font_size = 13,
	scrollback_lines = 100000,
	enable_scroll_bar = false,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	window_close_confirmation = "NeverPrompt",
	window_background_opacity = 0.97,
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
}
