-- 'bluz71/vim-nightfly-guicolors', -- preferred colorscheme
-- { "EdenEast/nightfox.nvim" },

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			-- dim_inactive = {
			-- 	enabled = true,
			-- 	shade = "dark",
			-- 	peercentage = 0.15,
			-- },
			-- custom_highlights = function(color)
			-- 	return {
			-- 		TabLineSel = {
			-- 			bg = color.red,
			-- 		},
			-- 		DiagnosticUnderlineError = {
			-- 			undercurl = true,
			-- 		},
			-- 		DiagnosticUnderlineWarn = {
			-- 			undercurl = true,
			-- 		},
			-- 		DiagnosticUnderlineHint = {
			-- 			undercurl = true,
			-- 		},
			-- 		DiagnosticUnderlineInfo = {
			-- 			undercurl = true,
			-- 		},
			-- 	}
			-- end,
			-- highlight_overrides = {
			-- 	all = function(color)
			-- 		return {
			-- 			TabLineSel = {
			-- 				bg = color.red,
			-- 			},
			-- 		}
			-- 	end,
			-- },
			integrations = {
				aerial = false,
				barbar = false,
				beacon = false,
				cmp = true,
				coc_nvim = false,
				dashboard = true,
				fern = false,
				fidget = false,
				gitgutter = false,
				gitsigns = true,
				harpoon = false,
				hop = false,
				illuminate = false,
				leap = true,
				lightspeed = false,
				lsp_saga = false,
				lsp_trouble = false,
				markdown = true,
				mason = true,
				mini = false,
				neogit = false,
				neotest = false,
				neotree = false,
				noice = false,
				notify = false,
				nvimtree = true,
				overseer = false,
				pounce = false,
				semantic_tokens = false,
				symbols_outline = false,
				telekasten = false,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				ts_rainbow = false,
				vim_sneak = false,
				vimwiki = false,
				which_key = false,
				bufferline = true,

				-- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
				dap = {
					enabled = false,
					enable_ui = false,
				},
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "undercurl" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				navic = {
					enabled = false,
					custom_bg = "NONE",
				},
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
