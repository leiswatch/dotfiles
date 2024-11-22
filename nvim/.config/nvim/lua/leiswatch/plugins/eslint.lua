return {
	"esmuellert/nvim-eslint",
	enabled = true,
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
			root_dir = function(bufnr)
				return eslint.resolve_git_dir(bufnr)
			end,
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
				useFlatConfig = function(bufnr)
					eslint.use_flat_config(bufnr)
				end,
				experimental = {
					useFlatConfig = false,
				},
				runtime = "node",
				nodePath = function()
					return eslint.resolve_node_path()
				end,
				format = true,
				run = "onType",
				validate = "on",
				workingDirectory = { mode = "location" },
				workspaceFolder = function(bufnr)
					local git_dir = eslint.resolve_git_dir(bufnr)

					return {
						uri = vim.uri_from_fname(git_dir),
						name = vim.fn.fnamemodify(git_dir, ":t"),
					}
				end,
			},
		})
	end,
}
