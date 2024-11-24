return {
	"esmuellert/nvim-eslint",
	enabled = false,
	ft = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
		"svelte",
		"astro",
	},
	config = function()
		local eslint = require("nvim-eslint")

		eslint.setup({
			-- root_dir = function(bufnr)
			-- 	return eslint.resolve_git_dir(bufnr)
			-- end,
			settings = {
				codeAction = {
					disableRuleComment = {
						enable = true,
						location = "separateLine",
					},
					showDocumentation = {
						enable = true,
					},
				},
				codeActionOnSave = {
					enable = true,
					mode = "all",
				},
				experimental = {
					useFlatConfig = false,
				},
				runtime = "node",
				format = true,
				run = "onType",
				validate = "on",
				workingDirectory = { mode = "location" },
			},
		})
	end,
}
