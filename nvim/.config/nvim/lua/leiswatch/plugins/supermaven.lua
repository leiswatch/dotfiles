return {
	"supermaven-inc/supermaven-nvim",
	enabled = false,
	event = { "InsertEnter" },
	opts = {
		disable_keymaps = true,
		log_level = "off",
		ignore_filetypes = {
			["grug-far"] = true,
			["neo-tree"] = true,
			fugitive = true,
			oil = true,
			snacks_input = true,
			help = true,
			["neo-tree-popup"] = true
		},
	},
}
