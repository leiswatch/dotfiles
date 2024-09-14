return {
	"Wansmer/treesj",
	keys = { "<leader>tj", "<leader>tJ" },
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
			notify = false,
		})
	end,
}
