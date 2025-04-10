return {
	"nvim-neotest/neotest",
	lazy = true,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},
	keys = {
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			{ noremap = true, silent = true },
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			{ noremap = true, silent = true },
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			{ noremap = true, silent = true },
		},
		{
			"<leader>to",
			function()
				require("neotest").output_panel.toggle()
			end,
			{ noremap = true, silent = true },
		},
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("neotest").setup({
			adapters = {
				require("neotest-vitest")({
					cwd = function(file)
						if string.find(file, "/packages|apps/") then
							return string.match(file, "(.-/[^/]+/)src")
						end
						return vim.fn.getcwd()
					end,
					vitestConfigFile = function(file)
						if string.find(file, "/packages|apps/") then
							return string.match(file, "(.-/[^/]+/)src") .. "vitest.config.ts"
						end

						return vim.fn.getcwd() .. "/vitest.config.ts"
					end,
					filter_dir = function(name)
						return name ~= "node_modules"
					end,
				}),
				require("neotest-golang")({}),
			},
		})
	end,
}
