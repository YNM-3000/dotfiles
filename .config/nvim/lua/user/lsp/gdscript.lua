local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end

vim.lsp.config("gdscript", {})
vim.lsp.enable("gdscript")
