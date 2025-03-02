return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			go = { "golangcilint" },
			templ = { "golangcilint" },
			lua = { "selene" },
			python = { "pylint" },
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
