return {
	"Wansmer/treesj",
	keys = {
		{
			"<leader>tj",
			function()
				require("treesj").toggle()
			end,
		},
		{
			"<leader>tJ",
			function()
				require("treesj").toggle({ split = { recursive = true } })
			end,
		},
	},
	-- dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
			notify = false,
		})
	end,
}
