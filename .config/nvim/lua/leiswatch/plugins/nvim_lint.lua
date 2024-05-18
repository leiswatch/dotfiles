return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	config = function()
		require("lint").linters_by_ft = {
			python = { "pylint" },
			go = { "golangcilint" },
		}
	end,
}
