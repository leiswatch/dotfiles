local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Mocha",
	--[[ color_scheme = "tokyonight", ]]
	font = wezterm.font("JetbrainsMono Nerd Font", { weight = "Medium", italic = false }),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	font_size = 13,
	scrollback_lines = 10000,
	enable_scroll_bar = false,
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
	window_close_confirmation = "NeverPrompt",
	window_background_opacity = 0.98,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
}
