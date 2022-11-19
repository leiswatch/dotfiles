vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_enabled = true
vim.g.gitblame_message_template = "<author> • <date> • <summary>"
local git_blame = require("gitblame")

local colors_catppuccin = {
	blue = "#8aadf4",
	cyan = "#7dc4e4",
	black = "#24273a",
	white = "#cad3f5",
	red = "#ed8796",
	violet = "#c6a0f6",
	grey = "#181926",
}

local custom_cattpuccin_theme = {
	normal = {
		a = { fg = colors_catppuccin.black, bg = colors_catppuccin.blue },
		b = { fg = colors_catppuccin.white, bg = colors_catppuccin.grey },
		c = { fg = colors_catppuccin.black, bg = colors_catppuccin.grey },
		x = { fg = colors_catppuccin.white, bg = colors_catppuccin.grey },
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

local config = {
	options = {
		icons_enabled = true,
		theme = custom_cattpuccin_theme,
		globalstatus = true,
		component_separators = "",
		section_separators = "",
	},
	--[[ winbar = { ]]
	--[[ 	lualine_a = {}, ]]
	--[[ 	lualine_b = {}, ]]
	--[[ 	lualine_c = { "filename", { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } }, ]]
	--[[ 	lualine_x = {}, ]]
	--[[ 	lualine_y = {}, ]]
	--[[ 	lualine_z = {}, ]]
	--[[ }, ]]
	sections = {
		lualine_a = {
			"mode",
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
		lualine_y = {},
		lualine_x = {
			--[[ "lsp_progress", ]]
			"diagnostics",
			"filetype",
			"progress",
			"fileformat",
			"encoding",
		},
		lualine_z = { "location" },
	},
	extensions = { "nvim-tree", "quickfix" },
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
		--[[ local buf_ft = vim.api.nvim_buf_get_option(0, "filetype") ]]
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
	icon = " :",
	color = { fg = colors_catppuccin.white, gui = "bold" },
})

require("lualine").setup(config)
