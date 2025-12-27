return {
	"voldikss/vim-translator",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set({ "n", "v" }, "<leader>tc", ":Translate<cr>", opts) --Echo translation in the cmdline
		keymap.set({ "n", "v" }, "<leader>tw", ":TranslateW<cr>", opts) --Display translation in a window
		keymap.set({ "n", "v" }, "<leader>tr", ":TranslateR<cr>", opts) --Replace the text with translation
		keymap.set({ "n", "v" }, "<leader>th", ":TranslateH<cr>", opts) --Export translation history
		keymap.set({ "n", "v" }, "<leader>tm", ":TranslateL<cr>", opts) --Display log message
		keymap.set({ "n", "v" }, "<leader>tx", ":TranslateX<cr>", opts) --Translate the text in clipboard
	end,
}
