local colors = {
	blue = "#89b4fa",
	cyan = "#89dceb",
	black = "#11111b",
	white = "#cdd6f4",
	red = "#f38ba8",
	violet = "#cba6f7",
	grey = "#313244",
	peach = "#fab387",
	base = "#1e1e2e",
	yellow = "#f9e2af",
	subtext = "#585b70",
	lavender = "#b4befe",
	green = "#a6e3a1",
}

local custom_cattpuccin_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.white, bg = colors.black },
		z = { fg = colors.black, bg = colors.yellow },
		c = { fg = colors.white, bg = colors.black },
		x = { fg = colors.white, bg = colors.black },
		y = { fg = colors.white, bg = colors.black },
	},
	insert = { a = { fg = colors.black, bg = colors.red } },
	visual = { a = { fg = colors.black, bg = colors.violet } },
	replace = { a = { fg = colors.black, bg = colors.blue } },
	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

-- local custom_rose_pine_theme = {
-- 	normal = {
-- 		a = { fg = '#21202e', bg = '#31748f' },
-- 		b = { fg = '#e0def4', bg = '#21202e' },
-- 		z = { fg = '#21202e', bg = '#f6c177' },
-- 		c = { fg = '#e0def4', bg = '#21202e' },
-- 		x = { fg = '#e0def4', bg = '#21202e' },
-- 		y = { fg = '#e0def4', bg = '#21202e' },
-- 	},
-- 	insert = { a = { fg = '#21202e', bg = '#eb6f92' } },
-- 	visual = { a = { fg = '#21202e', bg = '#c4a7e7' } },
-- 	replace = { a = { fg = '#21202e', bg = '#31748f' } },
-- 	inactive = {
-- 		a = { fg = '#e0def4', bg = '#21202e' },
-- 		b = { fg = '#e0def4', bg = '#21202e' },
-- 		c = { fg = '#21202e', bg = '#21202e' },
-- 	},
-- }

local config = {
	options = {
		icons_enabled = true,
		theme = custom_cattpuccin_theme,
		-- theme = custom_rose_pine_theme,
		globalstatus = true,
		component_separators = "",
		section_separators = "",
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = { -- Filetypes to disable lualine for.
			-- statusline = { "alpha", "packer", "mason" }, -- only ignores the ft for statusline.
			winbar = {}, -- only ignores the ft for winbar.
		},
	},
	sections = {
		lualine_a = {
			{ "mode", icons_enabled = true, icon = "" },
		},
		lualine_b = {},
		lualine_c = {
			"%=",
			{ colored = true, icon_only = true, "filetype" },
			{ "filename", padding = { left = 0 } },
			"diagnostics",
		},
		lualine_x = {
			"searchcount",
			-- "diagnostics",
			-- {
			-- 	"filetype",
			-- 	colored = true, -- Displays filetype icon in color if set to true
			-- 	icon_only = false, -- Display only an icon for filetype
			-- 	icon = { align = "left" },
			-- },
			{
				"diff",
				colored = true,
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.yellow },
					removed = { fg = colors.red },
					-- added = { fg = "#9ece6a" },
					-- modified = { fg = "#e0af68" },
					-- removed = { fg = "#f7768e" },
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
			{ "branch", icon = "󰘬" },
			{
				"fileformat",
				icons_enabled = true,
				-- symbols = {
				-- 	unix = "LF",
				-- 	dos = "CRLF",
				-- 	mac = "CR",
				-- },
			},
			{
				"encoding",
				fmt = function(str)
					return string.upper(str)
				end,
				color = { fg = colors.red },
				-- color = { fg = "#f7768e" },
			},
			"progress",
		},
		lualine_y = {},
		lualine_z = { "location" },
	},
	extensions = { "neo-tree", "quickfix", "fzf" },
}

-- local function ins_left(component)
-- 	table.insert(config.sections.lualine_c, component)
-- end

-- ins_left({
-- 	function()
-- 		return "%="
-- 	end,
-- })

-- ins_left({
-- 	-- Lsp server name .
-- 	function()
-- 		local lsp = ""
-- 		local msg = "No Active Lsp"
-- 		local clients = vim.lsp.get_active_clients()
-- 		if next(clients) == nil then
-- 			return msg
-- 		end
-- 		for _, client in ipairs(clients) do
-- 			if not lsp:find(client.name) then
-- 				lsp = client.name .. " " .. lsp
-- 			end
-- 		end

-- 		if lsp ~= "" then
-- 			return lsp
-- 		end

-- 		return msg
-- 	end,
-- 	icon = "",
-- 	color = { fg = colors.subtext, gui = "bold" },
-- })

require("lualine").setup(config)
