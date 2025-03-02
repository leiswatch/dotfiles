local helpers = require("leiswatch.helpers")

vim.keymap.set({ "i" }, "<C-l>", function()
	local suggestion = require("supermaven-nvim.completion_preview")

	if suggestion.has_suggestion() then
		suggestion.on_accept_suggestion()
	end
end, helpers.keymap_opts)

vim.keymap.set({ "i" }, "<C-h>", function()
	local suggestion = require("supermaven-nvim.completion_preview")

	if suggestion.has_suggestion() then
		suggestion.on_dispose_inlay()
	end
end, helpers.keymap_opts)
