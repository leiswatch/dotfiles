return {
	"lewis6991/gitsigns.nvim",
	opts = {
		debug_mode = false,
		signcolumn = true,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 250,
			ignore_whitespace = false,
			virt_text_priority = 999,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		preview_config = {
			border = "rounded",
		},
		on_attach = function()
			local gitsigns = require("gitsigns")
			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, opts)
			vim.keymap.set("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, opts)
			vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, opts)
			vim.keymap.set("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, opts)
			vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, opts)
			vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, opts)
		end,
	},
}
