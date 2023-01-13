require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "css", "scss", "graphql", "python", "tsx", "rust", "go", "lua" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	matchup = {
		enable = true,
	},
	rainbow = {
		enable = false,
		extend_mode = false,
		colors = {
			"#c4a7e7",
			"#9ccfd8",
			"#ebbcba",
			"#f6c177",
			-- "#eb6f92",
			-- "#31748f",
		},
	},
})
