local M = {}

local function contains(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

local function find_config_files(bufnr, config_files)
	local git_markers = { ".git" }
	local package_json_markers = { "package.json" }
	local package_json_dir = vim.fs.root(bufnr, package_json_markers)
	local git_dir = vim.fs.root(bufnr, git_markers)
	local root_dir = vim.uv.cwd()
	local dirs = { package_json_dir, git_dir, root_dir }

	for _, dir in pairs(dirs) do
		for _, config in pairs(config_files) do
			if vim.fn.filereadable(dir .. "/" .. config) == 1 then
				return true
			end
		end
	end

	return false
end

local function find_executable(paths, fallback)
	for _, path in ipairs(paths) do
		local normpath = vim.fs.normalize(path)
		local is_absolute = vim.startswith(normpath, "/")
		if is_absolute and vim.fn.executable(normpath) then
			return normpath
		end

		local idx = normpath:find("/", 1, true)
		local dir, subpath
		if idx then
			dir = normpath:sub(1, idx - 1)
			subpath = normpath:sub(idx)
		else
			-- This is a bare relative-path executable
			dir = normpath
			subpath = ""
		end

		local results = vim.fs.find(dir, { upward = true, limit = math.huge })

		for _, result in ipairs(results) do
			local fullpath = result .. subpath
			if vim.fn.executable(fullpath) == 1 then
				return fullpath
			end
		end
	end

	if fallback ~= nil then
		return fallback
	end
end

M.contains = contains
M.find_config_files = find_config_files
M.find_executable = find_executable
M.keymap_opts = { silent = true }
M.eslint_config_files = {
	"eslint.config.js",
	"eslint.config.mjs",
	"eslint.config.cjs",
	"eslint.config.ts",
	"eslint.config.mts",
	"eslint.config.cts",
}
M.biome_config_files = { "biome.json", "biome.jsonc" }

return M
