local nvimtree_ok, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_ok then
	return
end

-- recommended settings from nvim-tree documentation

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	-- open_on_setup = true, deprecated
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.config.mappings.default_on_attach(bufnr)

		vim.keymap.set("n", "l", api.node.open.preview, opts("Open Preview"))
		vim.keymap.set("n", "<C-o>", api.node.open.vertical, opts("Open: Vertical Split"))
		vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
		vim.keymap.set("n", "A", api.tree.expand_all, opts("Expand All"))
		vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
		vim.keymap.set("n", "Z", api.node.run.system, opts("Run System"))
	end,
	reload_on_bufenter = true,
	view = {
		adaptive_size = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		highlight_git = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			-- icons = {
			-- 	corner = "└",
			-- 	edge = "│",
			-- 	item = "│",
			-- 	bottom = "─",
			-- 	none = " ",
			-- },
		},
		icons = {
			-- git_placement = "before",
			show = {
				folder_arrow = false,
				-- file = true,
				-- folder = true,
				-- git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					-- arrow_open = "",
					-- arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "ﭟ",
					deleted = "",
					ignored = "",
				},
			},
		},
	},
	filters = {
		-- dotfiles = false,
		-- custom = {},
		-- exclude = {},
	},
	update_focused_file = {
		enable = true,
		-- update_root = false,
		-- ignore_list = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "󱍀",
			info = "",
			warning = "",
			error = "",
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = true,
			},
		},
	},
})

-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#naive-solution
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	nested = true,
-- 	callback = function()
-- 		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
-- 			vim.cmd("quit")
-- 		end
-- 	end,
-- })
