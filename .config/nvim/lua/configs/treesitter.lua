require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = true,
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
})
