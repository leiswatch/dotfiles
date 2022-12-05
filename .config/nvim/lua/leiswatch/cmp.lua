require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--[[ local t = function(str) ]]
--[[ 	return vim.api.nvim_replace_termcodes(str, true, true, true) ]]
--[[ end ]]

--[[ local kind_icons = { ]]
--[[ 	Text = "", ]]
--[[ 	Method = "", ]]
--[[ 	Function = "", ]]
--[[ 	Constructor = "", ]]
--[[ 	Field = "", ]]
--[[ 	Variable = "", ]]
--[[ 	Class = "ﴯ", ]]
--[[ 	Interface = "", ]]
--[[ 	Module = "", ]]
--[[ 	Property = "ﰠ", ]]
--[[ 	Unit = "", ]]
--[[ 	Value = "", ]]
--[[ 	Enum = "", ]]
--[[ 	Keyword = "", ]]
--[[ 	Snippet = "", ]]
--[[ 	Color = "", ]]
--[[ 	File = "", ]]
--[[ 	Reference = "", ]]
--[[ 	Folder = "", ]]
--[[ 	EnumMember = "", ]]
--[[ 	Constant = "", ]]
--[[ 	Struct = "", ]]
--[[ 	Event = "", ]]
--[[ 	Operator = "", ]]
--[[ 	TypeParameter = "", ]]
--[[ } ]]

cmp.setup({
	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		local buftype = vim.api.nvim_buf_get_option(0, "buftype")
		if buftype == "prompt" then
			return false
		end
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	view = {
		entries = "custom", -- can be "custom", "wildmenu" or "native"
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-y>"] = cmp.mapping(cmp.mapping.disable, { "i", "c", "s" }),
		["<C-x><C-o>"] = cmp.mapping.complete(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "path" },
		{ name = "buffer" },
		--[[ { name = "rg" }, ]]
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 120, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		}),
	},
	--[[ formatting = { ]]
	--[[ 	fields = { "kind", "abbr", "menu" }, ]]
	--[[ 	format = function(entry, vim_item) ]]
	--[[ 		vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind ]]

	--[[ 		local kind = require("lspkind").cmp_format({ ]]
	--[[ 			mode = "symbol_text", ]]
	--[[ 			maxwidth = 60, ]]
	--[[ 			menu = { ]]
	--[[ 				buffer = "[Buffer]", ]]
	--[[ 				nvim_lsp = "[LSP]", ]]
	--[[ 				luasnip = "[LuaSnip]", ]]
	--[[ 				nvim_lua = "[Lua]", ]]
	--[[ 				latex_symbols = "[Latex]", ]]
	--[[ 			}, ]]
	--[[ 		})(entry, vim_item) ]]

	--[[ 		local strings = vim.split(kind.kind, "%s", { trimempty = true }) ]]
	--[[ 		kind.kind = " " .. strings[1] .. " " ]]
	--[[ 		kind.menu = "    (" .. strings[2] .. ")" ]]

	--[[ 		return kind ]]
	--[[ 	end, ]]
	--[[ }, ]]
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
