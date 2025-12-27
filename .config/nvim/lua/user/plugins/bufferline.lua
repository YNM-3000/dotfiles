return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- version = "*",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				indicator = {
					-- icon = "▎", -- this should be omitted if indicator style is not 'icon'
					-- style = "icon",
					style = "underline",
				},
				-- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
				separator_style = "thin",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
			highlights = {
				separator_selected = {
					sp = "#f38ba8",
				},
				indicator_selected = {
					sp = "#f38ba8",
				},
				close_button_selected = {
					sp = "#f38ba8",
				},
				buffer_selected = {
					sp = "#f38ba8",
				},
			},
		})

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "<A-L>", "<Cmd>BufferLineMoveNext<CR>", opts)
		keymap.set("n", "<A-H>", "<Cmd>BufferLineMovePrev<CR>", opts)
	end,
}
