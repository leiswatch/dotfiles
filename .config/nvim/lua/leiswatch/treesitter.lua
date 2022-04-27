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
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		colors = {
			"#569cd6",
			"#dcdcaa",
			"#c678dd",
			"#608b4e",
			"#f44747",
			"#56b6c2",
		},
	},
})
