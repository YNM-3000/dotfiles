return {
	"mhinz/vim-startify",
	config = function()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		keymap.set("n", "<leader>ss", ":Startify<cr>", opts)
		keymap.set("n", "<leader>sa", ":SSave<cr>", opts)
		keymap.set("n", "<leader>sd", ":SDelete<cr>", opts)
		keymap.set("n", "<leader>sl", ":SLoad<cr>", opts)
		keymap.set("n", "<leader>sc", ":SClose<cr>", opts)
	end,
}
