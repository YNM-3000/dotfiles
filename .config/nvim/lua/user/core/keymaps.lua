local keymap = vim.keymap

vim.g.mapleader = " " -- leader key
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-------------------- general keymaps ----------------------
keymap.set({ "i", "v", "t", "c" }, "fd", "<ESC>", opts)

keymap.set("n", "v'", 'vi"', opts)
keymap.set("n", "c'", 'ci"', opts)
keymap.set("n", "y'", 'yi"', opts)
keymap.set("n", "d'", 'di"', opts)
keymap.set("n", "gsw", ":%s/<C-r><C-w>/", opts) -- Replace word under cursor

-- temp empty buffer
keymap.set("n", "gn", ":tabnew<CR>", opts)

keymap.set("n", "<leader>nh", ":nohl<CR>", opts) -- clear search
keymap.set("n", "<leader>-", "<C-x>") -- minus number
keymap.set("n", "<leader>+", "<C-a>") -- add number

keymap.set("n", "<leader>q", ":qa<cr>", opts) -- close all and exist
keymap.set("n", "<leader>Q", ":qa!<cr>", opts) -- close all and exist without saving
keymap.set({ "n", "v", "i" }, "<C-s>", "<cmd>w<cr>", opts) -- save
keymap.set({ "n", "v", "i" }, "<A-s>", "<cmd>noautocmd w<cr>", opts) -- save without format
keymap.set({ "n", "v" }, "H", "^", opts) -- move to head of line
keymap.set({ "n", "v" }, "L", "$", opts) -- move to end of line

-- windows
keymap.set("n", "<A-\\>", "<C-w>v") -- split window vertically
keymap.set("n", "<A-->", "<C-w>s") -- split window horizontally
keymap.set("n", "<A-e>", "<C-w>=") -- make split windows equal width
keymap.set("n", "<A-x>", ":close<CR>", opts) -- close current split window or tab

-- Resize with arrows
keymap.set("n", "<A-Up>", ":resize +2<CR>", opts)
keymap.set("n", "<A-Down>", ":resize -2<CR>", opts)
keymap.set("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap.set("n", "<A-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap.set("n", "<A-l>", ":bnext<CR>", opts)
keymap.set("n", "<A-h>", ":bprevious<CR>", opts)
-- keymap.set("n", "<A-L>", "<Cmd>BufferLineMoveNext<CR>", opts)
-- keymap.set("n", "<A-H>", "<Cmd>BufferLineMovePrev<CR>", opts)
keymap.set("n", "<A-d>", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts) -- close buffer without closing the window,see:https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window

-- tabs
keymap.set("n", "<A-t>", ":tabnew<CR>", opts) -- open new tab
-- keymap.set("n","<A-X>",":tabclose<CR>",opts) -- close current tab
keymap.set("n", "<A-]>", ":tabn<CR>", opts) -- go to next tab
keymap.set("n", "<A-[>", ":tabp<CR>", opts) -- go to previous tab

-- Move text up and down
keymap.set("n", "<A-j>", ":m .+1<CR>==", opts) -- move line down
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts) -- move line up
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- Move line down in visual mode
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- Move line up in visual mode

keymap.set("n", "<A-S-j>", "yyp==", opts) -- copy line down
keymap.set("n", "<A-S-k>", "yyP==", opts) -- copy line up
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- move lines down :m means :move use :h :m to see details
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- move lines up
-- keymap.set("v", "<A-S-j>", "yp==gv", opts) -- TODO:copy lines down
keymap.set("v", "<A-S-k>", "yP==gv", opts) -- copy lines up

-- stay indent mode
keymap.set("v", "<", "<gv", opts) -- indent left
keymap.set("v", ">", ">gv", opts) -- indent right

keymap.set("v", "p", '"_dp', opts) -- paste won't be coverd

------------------------ plugin keymaps ----------------------
-- vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- telescope
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
-- keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
-- keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
-- keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>")
-- -- keymap.set("n", "<leader>fg", "<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<cr>")
-- keymap.set("n", "<leader>fg", "<cmd>Telescope advanced_git_search diff_commit_file<cr>") --Diff current file with commit, see: https://github.com/aaronhallaert/advanced-git-search.nvim#%EF%B8%8F-commands
-- keymap.set("n", "<leader>fl", "<cmd>Telescope advanced_git_search diff_commit_line<cr>") --Diff current file with selected line history

--lsp config - Lspsaga
-- keymap.set("n", "gf", "<cmd>Lspsaga finder<cr>", opts)
-- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
-- keymap.set("n", "gD", "<cmd>Lspsaga peek_type_definition<cr>", opts)
-- keymap.set("n", "gt", "<cmd>Lspsaga incoming_calls<cr>", opts)
-- keymap.set("n", "gT", "<cmd>Lspsaga outgoing_calls<cr>", opts)
-- keymap.set("n", "<F1>", "<cmd>Lspsaga code_action<cr>", opts)
-- keymap.set("n", "<F2>", "<cmd>Lspsaga rename<cr>", opts)
-- keymap.set("n", "gh", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
-- -- keymap.set("n", "gh", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
-- keymap.set("n", "<Tab>", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
-- keymap.set("n", "<S-Tab>", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
-- keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
-- -- keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
-- keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
-- keymap.set("n", "<F6>", "<cmd>Lspsaga outline<cr>", opts)

-- harpoon
-- keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", opts)
-- keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
-- keymap.set("n", "<leader>hj", ":lua require('harpoon.ui').nav_next()<cr>", opts)
-- keymap.set("n", "<leader>hk", ":lua require('harpoon.ui').nav_prev()<cr>", opts)
--
-- undotree
-- keymap.set("n", "<F5>", ":UndotreeToggle<cr>", opts)

-- startify (for session)
-- keymap.set("n", "<leader>ss", ":Startify<cr>", opts)
-- keymap.set("n", "<leader>sa", ":SSave<cr>", opts)
-- keymap.set("n", "<leader>sd", ":SDelete<cr>", opts)
-- keymap.set("n", "<leader>sl", ":SLoad<cr>", opts)
-- keymap.set("n", "<leader>sc", ":SClose<cr>", opts)

-- ufo (for code fold)
-- keymap.set("n", "zz", ":foldclose<cr>", opts)
-- keymap.set("n", "zx", ":foldopen<cr>", opts)
-- keymap.set("n", "zZ", require("ufo").closeAllFolds, opts)
-- keymap.set("n", "zX", require("ufo").openAllFolds, opts)
-- keymap.set("n", "zp", function()
-- 	local winid = require("ufo").peekFoldedLinesUnderCursor()
-- 	if not winid then
-- 		vim.lsp.buf.hover()
-- 	end
-- end) -- hover preview

-- noice
-- keymap.set("n", "<leader>nn", ":Noice dismiss<cr>", opts)
-- keymap.set("n", "<leader>nm", ":Noice all<cr>", opts)

-- trouble
-- keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
-- keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
-- keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
-- keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
-- keymap.set("n", "<leader>xf", "<cmd>TroubleToggle quickfix<cr>", opts)
-- keymap.set("n", "<leader>xg", "<cmd>TroubleToggle lsp_references<cr>", opts)

----------- git ---------------
-- lazygit
-- keymap.set("n", "<leader>gg", ":LazyGit<cr>", opts)
-- keymap.set("n", "<leader>gc", ":LazyGitConfig<cr>", opts)
-- keymap.set("n", "<leader>gf", ":LazyGitFilter<cr>", opts)
-- keymap.set("n", "<leader>gff", ":LazyGitFilterCurrentFile<cr>", opts)

-- gitsign
-- keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", opts)
-- keymap.set("n", "<leader>gx", ":Gitsigns toggle_deleted<cr>", opts)
-- keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", opts)
-- keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<cr>", opts)
-- keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer<cr>", opts)
-- keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", opts)
-- keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", opts)
-- keymap.set("n", "<leader>gt", ":Gitsigns diffthis<cr>", opts)

-- diffview
-- keymap.set("n", "<leader>dd", ":DiffviewOpen<cr>", opts)
-- keymap.set("n", "<A-q>", ":DiffviewClose<cr>", opts) -- Close the current diffview. You can also use :tabclose.
-- keymap.set("n", "<leader>df", ":DiffviewFileHistory %<cr>", opts) -- Opening file history for current branch:

-- -- git conflict
-- keymap.set("n", "<leader>go", "<Plug>(git-conflict-ours)")
-- keymap.set("n", "<leader>gt", "<Plug>(git-conflict-theirs)")
-- keymap.set("n", "<leader>ga", "<Plug>(git-conflict-both)")
-- keymap.set("n", "<leader>gx", "<Plug>(git-conflict-none)")
-- keymap.set("n", "<leader>gp", "<Plug>(git-conflict-prev-conflict)")
-- keymap.set("n", "<leader>gn", "<Plug>(git-conflict-next-conflict)")

-- vim-translator
-- keymap.set({ "n", "v" }, "<leader>tc", ":Translate<cr>", opts) --Echo translation in the cmdline
-- keymap.set({ "n", "v" }, "<leader>tw", ":TranslateW<cr>", opts) --Display translation in a window
-- keymap.set({ "n", "v" }, "<leader>tr", ":TranslateR<cr>", opts) --Replace the text with translation
-- keymap.set({ "n", "v" }, "<leader>th", ":TranslateH<cr>", opts) --Export translation history
-- keymap.set({ "n", "v" }, "<leader>tm", ":TranslateL<cr>", opts) --Display log message
-- keymap.set({ "n", "v" }, "<leader>tx", ":TranslateX<cr>", opts) --Translate the text in clipboard

-------------- term ------------------
-- toggleterm
-- keymap.set("n", "<leader>tt", ":ToggleTerm direction=float<cr>", opts)
-- keymap.set("n", "<leader>tl", ":ToggleTermSendVisualSelection <T_ID> direction=float<cr>", opts)

-- in term
-- function _G.set_terminal_keymaps()
-- 	local _opts = { buffer = 0 }
-- 	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], _opts)
-- 	-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
-- 	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], _opts)
-- 	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], _opts)
-- 	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], _opts)
-- 	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], _opts)
-- end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
