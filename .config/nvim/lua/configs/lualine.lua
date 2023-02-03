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

-- local colors_rose_pine = {
-- 	base = "#191724",
-- 	surface = "#1f1d2e",
-- 	overlay = "#26233a",
-- 	muted = "#6e6a86",
-- 	subtle = "#908caa",
-- 	text = "#e0def4",
-- 	love = "#eb6f92",
-- 	gold = "#f6c177",
-- 	rose = "#ebbcba",
-- 	pine = "#31748f",
-- 	foam = "#9ccfd8",
-- 	iris = "#c4a7e7",
-- 	highlight_low = "#21202e",
-- 	highlight_med = "#403d52",
-- 	highlight_high = "#524f67",
-- }

-- local custom_rose_pine = {
-- 	normal = {
-- 		a = { fg = colors_rose_pine.surface, bg = colors_rose_pine.foam },
-- 		b = { fg = colors_rose_pine.text, bg = colors_rose_pine.surface },
-- 		z = { fg = colors_rose_pine.surface, bg = colors_rose_pine.rose },
-- 		c = { fg = colors_rose_pine.text, bg = colors_rose_pine.surface },
-- 		x = { fg = colors_rose_pine.text, bg = colors_rose_pine.surface },
-- 		y = { fg = colors_rose_pine.text, bg = colors_rose_pine.surface },
-- 	},
-- 	insert = { a = { fg = colors_rose_pine.base, bg = colors_rose_pine.love } },
-- 	visual = { a = { fg = colors_rose_pine.base, bg = colors_rose_pine.iris } },
-- 	replace = { a = { fg = colors_rose_pine.base, bg = colors_rose_pine.pine } },
-- 	inactive = {
-- 		a = { fg = colors_rose_pine.text, bg = colors_rose_pine.base },
-- 		b = { fg = colors_rose_pine.text, bg = colors_rose_pine.base },
-- 		c = { fg = colors_rose_pine.base, bg = colors_rose_pine.surface },
-- 	},
-- }

local config = {
	options = {
		icons_enabled = true,
		theme = custom_cattpuccin_theme,
		globalstatus = true,
		component_separators = "",
		-- section_separators = "",
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = { -- Filetypes to disable lualine for.
			statusline = { "alpha", "packer", "mason" }, -- only ignores the ft for statusline.
			winbar = {}, -- only ignores the ft for winbar.
		},
	},
	sections = {
		lualine_a = {
			{ "mode", icons_enabled = true, icon = "" },
		},
		lualine_b = {
			{ "filename", icon = "󰈔" },
			{ "branch", icon = "" },
			{
				"diff",
				colored = true,
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.yellow },
					removed = { fg = colors.red },
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
		},
		lualine_c = {},
		lualine_x = {
			"diagnostics",
			{
				"filetype",
				colored = true, -- Displays filetype icon in color if set to true
				icon_only = false, -- Display only an icon for filetype
				icon = { align = "left" },
			},
			{
				"fileformat",
				icons_enabled = true,
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
			{
				"encoding",
				fmt = function(str)
					return string.upper(str)
				end,
				color = { fg = colors.red },
			},
			-- "progress",
			"%P",
		},
		lualine_y = {},
		lualine_z = { "location" },
	},
	extensions = { "neo-tree", "quickfix", "fzf" },
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

ins_left({
	function()
		return "%="
	end,
})

ins_left({
	-- Lsp server name .
	function()
		local lsp = ""
		local msg = "No Active Lsp"
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			if not lsp:find(client.name) then
				lsp = client.name .. " " .. lsp
			end
		end

		if lsp ~= "" then
			return lsp
		end

		return msg
	end,
	icon = "",
	color = { fg = colors.subtext, gui = "bold" },
})

require("lualine").setup(config)
