local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		-- set keybinds
		opts.desc = "Show LSP references"
		keymap.set("n", "gf", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

		opts.desc = "Go to definition"
		keymap.set("n", "gd", function()
			vim.lsp.buf.definition({
				on_list = function(options)
					local filtered_items = {}
					for _, item in ipairs(options.items) do
						-- Assuming 'item.filename' or 'item.uri' contains the path information
						if not string.find(item.filename or item.uri, "react/index.d.ts") then
							table.insert(filtered_items, item)
						end
					end
					-- Process or display the filtered_items
					-- For example, open the first filtered definition
					if #filtered_items > 0 then
						local first_item = filtered_items[1]
						vim.fn.setqflist({ first_item }, "r")
						vim.cmd("cfirst")
					else
						print("No suitable definition found after filtering.")
					end
				end,
			})
		end, opts) -- go to declaration
		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

		opts.desc = "Show LSP incoming calls"
		keymap.set("n", "gt", "<cmd>Telescope lsp_incoming_calls<CR>", opts) -- show lsp type definitions

		-- opts.desc = "Show LSP definitions"
		-- keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
		--
		-- opts.desc = "Show LSP implementations"
		-- keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
		--
		-- opts.desc = "Show LSP type definitions"
		-- keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<F1>", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart rename"
		keymap.set("n", "<F2>", vim.lsp.buf.rename, opts) -- smart rename

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<F3>", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

		-- opts.desc = "Next diagnostic and show code actions"
		-- keymap.set("n", "<Tab>", function()
		-- 	vim.diagnostic.goto_next({ float = false }) -- Jump to next diagnostic and hide diagnostic float
		-- 	vim.lsp.buf.code_action() -- Request and display code actions
		-- end, opts) -- jump to previous diagnostic in buffer
		--
		-- opts.desc = "Previous diagnostic and show code actions"
		-- keymap.set("n", "<S-Tab>", function()
		-- 	vim.diagnostic.goto_prev({ float = false }) -- Jump to previous diagnostic and hide diagnostic float
		-- 	vim.lsp.buf.code_action() -- Request and display code actions
		-- end, opts) -- jump to next diagnostic in buffer
		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "<Tab>", vim.diagnostic.goto_next, opts) -- jump to previous diagnostic in buffer

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "<S-Tab>", vim.diagnostic.goto_prev, opts) -- jump to next diagnostic in buffer

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

		opts.desc = "Show line diagnostics"
		keymap.set("n", "J", vim.diagnostic.open_float, opts) -- show diagnostics for line

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	end,
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
			-- [vim.diagnostic.severity.ERROR] = " ",
			-- [vim.diagnostic.severity.WARN] = " ",
			-- [vim.diagnostic.severity.HINT] = "󰠠 ",
			-- [vim.diagnostic.severity.INFO] = " ",
		},
	},
	float = {
		border = "rounded",
		source = true,
	},
	update_in_insert = false,
	-- virtual_lines = true,
	virtual_text = true,
	severity_sort = true,
})
