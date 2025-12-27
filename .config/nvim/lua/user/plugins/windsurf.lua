return {
	"Exafunction/windsurf.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			virtual_text = {
				enabled = true,
				key_bindings = {
					accept = "<C-y>",
					-- accept_word = false,
					-- accept_line = false,
					-- next = "<C-n>",
					-- prev = "<C-p>",
					-- dismiss = "<C-e>"
				},
			},
		})
	end,
}
