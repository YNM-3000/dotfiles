return {
	"kevinhwang91/nvim-ufo",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "kevinhwang91/promise-async",
	config = function()
		local ufo = require("ufo")

		-- Customize fold text
		-- see: https://github.com/kevinhwang91/nvim-ufo#customize-fold-text
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end
		-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
		-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
		-- see: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
		ufo.setup({
			fold_virt_text_handler = handler,
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "zz", ":foldclose<cr>", opts)
		keymap.set("n", "zx", ":foldopen<cr>", opts)
		keymap.set("n", "zZ", require("ufo").closeAllFolds, opts)
		keymap.set("n", "zX", require("ufo").openAllFolds, opts)
		keymap.set("n", "zp", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end) -- hover preview
	end,
}
