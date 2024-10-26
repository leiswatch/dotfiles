return {
	"kevinhwang91/nvim-ufo",
	enabled = false,
	dependencies = { "kevinhwang91/promise-async" },
	event = { "BufRead" },
	config = function()
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
