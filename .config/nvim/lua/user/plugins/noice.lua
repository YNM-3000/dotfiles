return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
				},
				opts = { skip = true },
			},
		},
	},
	config = function(_, opt)
		require("noice").setup(opt)

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "<leader>nn", ":Noice dismiss<cr>", opts)
		keymap.set("n", "<leader>nm", ":Noice all<cr>", opts)
	end,
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		{ "rcarriga/nvim-notify", opts = { background_colour = "#1e1e2e" } },
	},
}
