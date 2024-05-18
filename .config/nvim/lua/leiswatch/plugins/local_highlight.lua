return {
	"tzachar/local-highlight.nvim",
    enabled = false,
	config = function()
		require("local-highlight").setup({
			hlgroup = "Search",
			insert_mode = false,
            highlight_single_match = true,
		})
	end,
}
