local opts = { noremap = true, silent = true }
local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lspinfo",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "rounded" })
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsUpdateCompleted",
	callback = function()
		vim.schedule(function()
			vim.notify("mason-tool-installer has finished")
		end)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		-- "alpha",
		"lspinfo",
		"lsp-installer",
		"null-ls-info",
		"NvimTree",
		"buffer_manager",
		"harpoon",
		"TelescopePrompt",
		"mason",
	},
	callback = function()
		vim.o.relativenumber = false
		vim.o.colorcolumn = "0"
	end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>ccl<cr>", opts)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "DressingSelect" },
	callback = function()
		vim.b.matchup_matchparen_enabled = 0
		vim.b.matchup_matchparen_fallback = 0
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd([[setlocal formatoptions-=ro]])
	end,
})

-- local function _1_()
-- 	local search = vim.api.nvim_get_hl(0, { name = "Search" })
-- 	vim.api.nvim_set_hl(0, "CurSearch", { link = "IncSearch" })
-- 	vim.api.nvim_set_hl(0, "SearchCurrentN", search)
-- 	return vim.api.nvim_set_hl(0, "Search", { link = "SearchCurrentN" })
-- end

-- vim.api.nvim_create_autocmd("ColorScheme", { callback = _1_ })

-- local function _2_()
-- 	vim.opt.hlsearch = true
-- 	vim.opt.incsearch = true
-- 	return vim.api.nvim_set_hl(0, "Search", { link = "SearchCurrentN" })
-- end

-- vim.api.nvim_create_autocmd("CmdlineEnter", { pattern = "/,\\?", callback = _2_ })

-- local function _3_()
-- 	vim.api.nvim_set_hl(0, "Search", {})
-- 	local function _4_()
-- 		vim.opt.hlsearch = true
-- 		return nil
-- 	end
-- 	return vim.defer_fn(_4_, 5)
-- end

-- vim.api.nvim_create_autocmd("CmdlineLeave", { pattern = "/,\\?", callback = _3_ })

-- local function _5_()
-- 	local function _6_()
-- 		return vim.cmd("nohlsearch")
-- 	end
-- 	return vim.schedule(_6_)
-- end

-- vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMoved" }, { callback = _5_ })

-- local function handle_n_N(key)
-- 	do
-- 		local other
-- 		local function _7_(_241)
-- 			local _8_ = _241
-- 			if _8_ == "n" then
-- 				return "N"
-- 			elseif _8_ == "N" then
-- 				return "n"
-- 			else
-- 				return nil
-- 			end
-- 		end
-- 		other = _7_
-- 		local feed
-- 		local function _10_(_241)
-- 			return vim.api.nvim_feedkeys(_241, "n", true)
-- 		end
-- 		feed = _10_
-- 		local _11_ = vim.v.searchforward
-- 		if _11_ == 0 then
-- 			feed(other(key))
-- 		elseif _11_ == 1 then
-- 			feed(key)
-- 		else
-- 		end
-- 	end
-- 	local function _13_()
-- 		vim.opt.hlsearch = true
-- 		return nil
-- 	end
-- 	return vim.defer_fn(_13_, 5)
-- end

-- local function _14_()
-- 	return handle_n_N("n")
-- end

-- vim.keymap.set({ "n" }, "n", _14_)

-- local function _15_()
-- 	return handle_n_N("N")
-- end

-- return vim.keymap.set({ "n" }, "N", _15_)
