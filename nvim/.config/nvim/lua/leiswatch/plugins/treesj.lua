return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	keys = {
		{
			"<leader>tj",
			function()
				require("treesj").toggle()
			end,
			{ noremap = true, silent = true },
		},
		{
			"<leader>tJ",
			function()
				require("treesj").toggle({ split = { recursive = true } })
			end,
			{ noremap = true, silent = true },
		},
	},
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
			notify = false,
		})
	end,
}
