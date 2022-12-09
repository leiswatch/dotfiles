local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lspinfo",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "rounded" })
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lsp-installer",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "rounded" })
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "null-ls-info",
	callback = function()
		vim.api.nvim_win_set_config(0, { border = "rounded" })
		vim.opt.colorcolumn = ""
	end,
})

--[[ vim.api.nvim_create_autocmd("BufEnter", { ]]
--[[   group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}), ]]
--[[   pattern = "NvimTree_*", ]]
--[[   callback = function() ]]
--[[     local layout = vim.api.nvim_call_function("winlayout", {}) ]]
--[[     if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end ]]
--[[   end ]]
--[[ }) ]]

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

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

vim.cmd([[
	autocmd FileType alpha, lspinfo, lsp-installer, null-ls-info, NvimTree setl colorcolumn=0
]])
