return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	enabled = true,
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
			go = { "golangcilint" },
			yaml = { "yamllint" },
			zsh = { "zsh" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
