local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")
		-- themes
		use({ "catppuccin/nvim", as = "catppuccin" })
		-- lspconfig
		use({ "neovim/nvim-lspconfig" })
		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})
		use({
			"windwp/nvim-ts-autotag",
		})
		use({ "JoosepAlviste/nvim-ts-context-commentstring" })
		-- mason
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		use("jayp0521/mason-null-ls.nvim")
		-- cmp
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-cmdline" })
		use({ "hrsh7th/nvim-cmp" })
		use({ "L3MON4D3/LuaSnip" })
		use({ "saadparwaiz1/cmp_luasnip" })
		use({ "hrsh7th/cmp-nvim-lua" })
		-- friendly snippets
		use({ "rafamadriz/friendly-snippets" })
		-- lualine
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		-- autopairs
		use({
			"windwp/nvim-autopairs",
		})
		-- comment
		use({
			"numToStr/Comment.nvim",
		})
		-- dressing
		use({ "stevearc/dressing.nvim" })
		-- fidget
		use({ "j-hui/fidget.nvim" })
		-- bufferline
		use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
		-- lspkind
		use({ "onsails/lspkind.nvim" })
		-- icons
		use({ "nvim-tree/nvim-web-devicons" })
		-- plenary
		use({ "nvim-lua/plenary.nvim" })
		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		-- harpoon
		use("ThePrimeagen/harpoon")
		-- colorizer
		use("NvChad/nvim-colorizer.lua")
		-- gitsigns
		use({
			"lewis6991/gitsigns.nvim",
		})
		-- alpha
		use({
			"goolord/alpha-nvim",
		})
		-- navic
		use({ "smiteshp/nvim-navic" })
		-- barbecue
		use({
			"utilyre/barbecue.nvim",
		})
		-- neoformat
		use({ "sbdchd/neoformat" })
		-- suround
		use({ "kylechui/nvim-surround", tag = "*" })
		-- null-ls
		use("jose-elias-alvarez/null-ls.nvim")
		-- numbers
		use("nkakouros-original/numbers.nvim")
		-- lspsaga
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
		})
		-- trouble
		use("folke/trouble.nvim")
		-- bufdelete
		use("famiu/bufdelete.nvim")
		-- bqf
		use({ "kevinhwang91/nvim-bqf", ft = "qf" })
		-- vim-fugitive
		-- use({ "tpope/vim-fugitive" })
		-- neogit
		use({ "TimUntersberger/neogit" })
		-- neotree
		use({ "MunifTanjim/nui.nvim" })
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
		})
		use({ "s1n7ax/nvim-window-picker", tag = "v1.*" })
		-- which key
		use({ "folke/which-key.nvim" })
    -- feline
    use({"feline-nvim/feline.nvim"})

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		max_jobs = 5,
		display = {
			prompt_border = "rounded",
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
