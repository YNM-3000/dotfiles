return {
	"szw/vim-maximizer",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)
	end,
}
