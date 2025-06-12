local loaded = pcall(require, "neo-tree.command")

if not loaded then
	return
end

local helpers = require("leiswatch.helpers")

vim.keymap.set("n", "<C-n>", function()
	require("neo-tree.command").execute({
		action = "focus",
		toggle = true,
		position = "left",
		reveal_force_cwd = true,
	})
end, helpers.keymap_opts)

-- vim.keymap.set("n", "-", function()
-- 	local reveal_file = vim.fn.expand("%:p")
-- 	if reveal_file == "" then
-- 		reveal_file = vim.fn.getcwd()
-- 	else
-- 		local f = io.open(reveal_file, "r")
-- 		if f then
-- 			f.close(f)
-- 		else
-- 			reveal_file = vim.fn.getcwd()
-- 		end
-- 	end
-- 	require("neo-tree.command").execute({
-- 		action = "focus", -- OPTIONAL, this is the default value
-- 		source = "filesystem", -- OPTIONAL, this is the default value
-- 		position = "left", -- OPTIONAL, this is the default value
-- 		reveal_file = reveal_file, -- path to file or folder to reveal
-- 		reveal_force_cwd = true, -- change cwd without asking if needed
-- 	})
-- end, { desc = "Open neo-tree at current file or working directory" })
