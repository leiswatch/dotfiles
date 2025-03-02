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
			border = "single",
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
			vim.keymap.set({ "n", "v" }, "<leader>gp", gitsigns.preview_hunk, opts)
			vim.keymap.set("n", "<leader>gb", function()
				gitsigns.blame_line()
			end, opts)
			vim.keymap.set("n", "<leader>gt", function()
				local buffers = vim.api.nvim_list_bufs()

				if #buffers > 0 then
					for i = 1, #buffers do
						local filetype = vim.api.nvim_get_option_value("filetype", { buf = buffers[i] })

						if filetype == "gitsigns-blame" then
							vim.api.nvim_buf_delete(buffers[i], { force = true })

							return
						end
					end
				end

				gitsigns.blame()
			end, opts)
			vim.keymap.set("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, opts)
			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, opts)
		end,
	},
}
