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
		colors = {
			"#B48EAD",
			"#A3BE8C",
			"#EBCB8B",
			"#D08770",
			"#BF616A",
			"#abb2c0",
		},
	},
})
