return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen" },
	opts = function()
		local actions = require("diffview.actions")

		return {
			view = {
				default = {
					-- Config for changed files, and staged files in diff views.
					layout = "diff2_horizontal",
					winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
				},
				merge_tool = {
					-- Config for conflicted files in diff views during a merge or rebase.
					layout = "diff3_mixed",
					disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
					winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
				},
			},
			hooks = {
				view_opened = function()
					if vim.fn.exists(":TSContextDisable") ~= 0 then
						vim.api.nvim_exec2(":TSContextDisable", {})
					end
					if vim.fn.exists(":LspStop") ~= 0 then
						vim.api.nvim_exec2(":LspStop", {})
					end
				end,
				view_closed = function()
					if vim.fn.exists(":TSContextEnable") ~= 0 then
						vim.api.nvim_exec2(":TSContextEnable", {})
					end
					if vim.fn.exists(":LspStart") ~= 0 then
						vim.api.nvim_exec2(":LspStart", {})
					end
				end,
			},
			keymaps = {
				disable_defaults = false, -- Disable the default keymaps
				view = {
					-- The `view` bindings are active in the diff buffers, only when the current
					-- tabpage is a Diffview.
					{
						"n",
						"<leader>cu",
						actions.conflict_choose("all"),
						{ desc = "Choose all the versions of a conflict" },
					},
					{
						"n",
						"<leader>cU",
						actions.conflict_choose_all("all"),
						{ desc = "Choose all the versions of a conflict for the whole file" },
					},
				},
			},
		}
	end,
}
