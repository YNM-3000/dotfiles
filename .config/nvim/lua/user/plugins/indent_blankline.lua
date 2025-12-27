return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	-- opts = {
	-- 	indent = { char = "┊" },
	-- },
	config = function()
		local indent_blankline = require("ibl")

		local highlight = {
			"Error",
			"Constant",
			"String",
			"Function",
			"Statement",
			"Type",
			"Label",
		}

		vim.g.rainbow_delimiters = { highlight = highlight }

		indent_blankline.setup({
			indent = {
				char = "╎",
			},
			scope = {
				char = "▏",
				highlight = highlight,
				-- priority = 500,
			},
		})
	end,
}
