return {
	"nvim-lua/popup.nvim", -- an implementation of the Popup Api from vim to neovim
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	-- { "norcalli/nvim-colorizer.lua" },
	-- "szw/vim-maximizer", -- maximizes and restores current window

	-- essential plugins
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	"numToStr/Comment.nvim",

	-- todo
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- vs-code like icons
	"kyazdani42/nvim-web-devicons",

	-- rainbow delimiters
	"HiPhish/rainbow-delimiters.nvim",

	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

	"mg979/vim-visual-multi",

	-------- go --------
	-- { "fatih/vim-go", event = "VeryLazy" },

	-------- java --------
	-- { "mfussenegger/nvim-jdtls", event = "VeryLazy" },
}
