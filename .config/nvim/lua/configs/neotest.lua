require("neotest").setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "yarn run jest",
			jestConfigFile = function()
				local file = vim.fn.expand("%:p")
				if string.find(file, "/packages/") then
					if string.find(file, "/utils/") then
						return string.match(file, "(.-/[^/]+/)utils") .. "jest.config.js"
					end
					if string.find(file, "/src/") then
						return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
					end
				end

				return vim.fn.getcwd() .. "/jest.config.js"
			end,
			cwd = function()
				local file = vim.fn.expand("%:p")
				if string.find(file, "/packages/") then
					if string.find(file, "/utils/") then
						return string.match(file, "(.-/[^/]+/)utils")
					end
					if string.find(file, "/src/") then
						return string.match(file, "(.-/[^/]+/)src")
					end
				end
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-go"),
	},
})
