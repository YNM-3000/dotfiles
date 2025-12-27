return {
	"mbbill/undotree",
	config = function()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		keymap.set("n", "<F5>", ":UndotreeToggle<cr>", opts)
	end,
}
