local options = {
	backup = false, -- creates a backup file
	backupcopy = "yes", -- make webpack-dev-server hot reload work see:https://github.com/webpack/webpack/issues/781#issuecomment-95523711
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	updatetime = 300, -- faster completion (4000ms default)
	tabstop = 2, -- insert 2 spaces for a tab
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	expandtab = true, -- convert tabs to spaces
	autoindent = true, -- tabs & indentation
	wrap = true, -- display lines as one long line
	linebreak = true, -- companion to wrap, don't split words
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	ignorecase = true, -- ignore case in search patterns
	smartcase = true, -- make search smart with case
	mouse = "a", -- allow the mouse to be used in neovim
	cursorline = true, -- highlight the current line
	cursorcolumn = true, -- highlight the current column
	termguicolors = true,
	backspace = "indent,eol,start",
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	undofile = true, -- enable persistent undo
	spelllang = "en",
	spell = true,
	foldcolumn = "1",
	foldlevel = 99, -- Using ufo provider need a large value
	foldlevelstart = 99,
	foldenable = true,
	fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
	-- winborder = "rounded",
	-- background = "dark",
	-- cmdheight = 2,                           -- more space in the neovim command line for displaying messages
	-- fileencoding = "utf-8",                  -- the encoding written to a file
	-- hlsearch = true,                         -- highlight all matches on previous search pattern
	-- pumheight = 10,                          -- pop up menu height
	-- showtabline = 2,                         -- always show tabs
	-- smartindent = true,                      -- make indenting smarter again
	-- swapfile = false,                        -- creates a swapfile
	-- timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	-- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	-- numberwidth = 4,                         -- set number column width to 2 {default 4}
	--  guifont = "monospace:h17",               -- the font used in graphical neovim applications
	-- whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
}

local opt = vim.opt

for key, value in pairs(options) do
	opt[key] = value
end

-- opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
opt.iskeyword:append("-") -- hyphenated words recognized by searches
opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
opt.clipboard:append("unnamedplus") -- allows neovim to access the system clipboard
