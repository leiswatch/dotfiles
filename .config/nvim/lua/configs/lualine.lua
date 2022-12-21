local colors_catppuccin = {
	blue = "#89b4fa",
	cyan = "#89dceb",
	black = "#181825",
	white = "#cdd6f4",
	red = "#f38ba8",
	violet = "#cba6f7",
	grey = "#313244",
	peach = "#fab387",
	base = "#1e1e2e",
	yellow = "#f9e2af",
	subtext = "#585b70",
	lavender = "#b4befe",
}

local custom_cattpuccin_theme = {
	normal = {
		a = { fg = colors_catppuccin.black, bg = colors_catppuccin.blue },
		b = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
		z = { fg = colors_catppuccin.black, bg = colors_catppuccin.yellow },
		c = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
		x = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
		y = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
	},
	insert = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.red } },
	visual = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.violet } },
	replace = { a = { fg = colors_catppuccin.black, bg = colors_catppuccin.blue } },
	inactive = {
		a = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
		b = { fg = colors_catppuccin.white, bg = colors_catppuccin.black },
		c = { fg = colors_catppuccin.black, bg = colors_catppuccin.black },
	},
}
--  
local config = {
	options = {
		icons_enabled = true,
		theme = custom_cattpuccin_theme,
		globalstatus = true,
		component_separators = "",
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = { -- Filetypes to disable lualine for.
			statusline = { "alpha", "packer", "mason" }, -- only ignores the ft for statusline.
			winbar = {}, -- only ignores the ft for winbar.
		},
	},
	sections = {
		lualine_a = {
			{ "mode" },
		},
		lualine_b = {
			{ "branch", icon = "" },
			{
				"diff",
				colored = true,
				diff_color = {
					added = { fg = "#a6da95" },
					modified = { fg = "#eed49f" },
					removed = { fg = "#ed8796" },
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
			"filename",
		},
		lualine_c = {},
		lualine_x = { "diagnostics", "filetype", "fileformat", "encoding", "progress" },
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
	color = { fg = colors_catppuccin.subtext, gui = "bold" },
})

require("lualine").setup(config)
