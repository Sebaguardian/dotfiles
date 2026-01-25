vim.cmd.packadd("nvim.undotree")

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("state") .. "/undodir"
vim.o.undofile = true

vim.o.hidden = true
vim.o.sessionoptions = "help,tabpages,winsize"
