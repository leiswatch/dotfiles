local M = {}

local function contains(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

local function use_eslint_flat_config(bufnr)
	local git_markers = { ".git" }
	local package_json_markers = { "package.json" }
	local package_json_dir = vim.fs.root(bufnr, package_json_markers)
	local git_dir = vim.fs.root(bufnr, git_markers)
	local root_dir = vim.uv.cwd()
	local dirs = { package_json_dir, git_dir, root_dir }
	local eslint_configs = {
		"/eslint.config.js",
		"/eslint.config.mjs",
		"/eslint.config.cjs",
		"/eslint.config.ts",
		"/eslint.config.mts",
		"/eslint.config.cts",
	}

	for _, dir in pairs(dirs) do
		for _, config in pairs(eslint_configs) do
			if vim.fn.filereadable(dir .. config) == 1 then
				return true
			end
		end
	end

	return false
end

local function get_first_formatter(bufnr, ...)
	local conform = require("conform")
	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end
	return select(1, ...)
end

M.contains = contains
M.use_eslint_flat_config = use_eslint_flat_config
M.get_first_formatter = get_first_formatter

return M
