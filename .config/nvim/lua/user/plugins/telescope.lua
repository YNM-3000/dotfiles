return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		{
			"aaronhallaert/advanced-git-search.nvim",
			dependencies = {
				-- to show diff splits and open commits in browser
				"tpope/vim-fugitive",
				-- to open commits in browser with fugitive
				"tpope/vim-rhubarb",
			},
		},
		"debugloop/telescope-undo.nvim",
		{
			"edolphin-ydf/goimpl.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-lua/popup.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {

				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						preview_cutoff = 1,
					},
				},
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						["<A-q>"] = actions.close,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,

						["<CR>"] = actions.select_default,
						["<C-->"] = actions.select_horizontal,
						["<C-\\>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<A-k>"] = actions.preview_scrolling_up,
						["<A-j>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						-- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-?>"] = actions.which_key, -- keys from pressing <C-/>
					},

					n = {
						["<esc>"] = actions.close,
						["q"] = actions.close,
						["<A-q>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-->"] = actions.select_horizontal,
						["<C-\\>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						-- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<A-k>"] = actions.preview_scrolling_up,
						["<A-j>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["?"] = actions.which_key,
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					theme = "dropdown",
					previewer = false,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
					},
				},
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("goimpl")
		telescope.load_extension("advanced_git_search")
		telescope.load_extension("undo")
		telescope.load_extension("ui-select")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
		keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
		-- keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
		keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>")
		-- keymap.set("n", "<leader>fg", "<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<cr>")
		keymap.set("n", "<leader>fg", "<cmd>Telescope advanced_git_search diff_commit_file<cr>") --Diff current file with commit, see: https://github.com/aaronhallaert/advanced-git-search.nvim#%EF%B8%8F-commands
		keymap.set("n", "<leader>fl", "<cmd>Telescope advanced_git_search diff_commit_line<cr>") --Diff current file with selected line history
	end,
}
