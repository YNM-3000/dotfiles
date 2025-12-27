return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
			local keymap = vim.keymap
			local opts = { noremap = true, silent = true }
			keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", opts)
			keymap.set("n", "<leader>gx", ":Gitsigns toggle_deleted<cr>", opts)
			keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", opts)
			keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<cr>", opts)
			keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer<cr>", opts)
			keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", opts)
			keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", opts)
			keymap.set("n", "<leader>gt", ":Gitsigns diffthis<cr>", opts)
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
			{ "<leader>gc", "<cmd>LazyGitConfig<cr>", desc = "Open lazy git" },
		},
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
		keys = {
			{ "<leader>dd", "<cmd>DiffviewOpen<cr>", desc = "Open Diff view" },
			{ "<A-q>", "<cmd>DiffviewClose<cr>", desc = "Close Diff view" },
			{ "<leader>df", "<cmd>DiffviewFileHistory<cr>", desc = "Open File History Diff view" },
		},
	},
	{ "akinsho/git-conflict.nvim", event = "VeryLazy" },
	{ "rhysd/git-messenger.vim", event = "VeryLazy" },
}
