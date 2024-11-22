return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	enabled = true,
	config = function()
		require("lint").linters_by_ft = {
			python = { "pylint" },
			go = { "golangcilint" },
			yaml = { "yamllint" },
			zsh = { "zsh" },
		}
	end,
}
