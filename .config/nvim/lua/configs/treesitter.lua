require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"javascript",
		"typescript",
		"css",
		"scss",
		"graphql",
		"python",
		"tsx",
		"rust",
		"go",
		"lua",
		"vim",
    "markdown",
    "markdown_inline",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	matchup = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = false,
	},
})
