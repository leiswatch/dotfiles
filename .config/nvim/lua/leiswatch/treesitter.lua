require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { "go", "python" },
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		-- Catppuccin
		colors = {
			"#cba6f7",
			"#a6e3a1",
			"#f9e2af",
			"#fab387",
			"#f38ba8",
			"#c6d0f5",
		},
	},
})
