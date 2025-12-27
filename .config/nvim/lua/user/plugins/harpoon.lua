return {
	"ThePrimeagen/harpoon",

	config = function()
		local harpoon = require("harpoon")

		harpoon.setup()

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", opts)
		keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
		keymap.set("n", "<leader>hj", ":lua require('harpoon.ui').nav_next()<cr>", opts)
		keymap.set("n", "<leader>hk", ":lua require('harpoon.ui').nav_prev()<cr>", opts)
	end,
}
