local silent = true
local no_silent = false

local function map(mode, key, val, verbose)
	vim.keymap.set(mode, key, val, { noremap = true, silent = verbose })
end


-- set leader
map("", "<Space>", "<Nop>", silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "K", "<cmd>m .-2<cr>", silent)     -- move current line 1 line up
map("n", "<C-UP>", "<cmd>m .-2<cr>", silent)
map("n", "J", "<cmd>m .+1<cr>", silent)     -- move current line 1 line down
map("n", "<C-DOWN>", "<cmd>m .+1<cr>", silent)

map("n", "Y", "y$") -- yank to end of line

map("n", "<leader>P", ":PlugInstall<CR>", silent) --vim-plug install
map("n", "<leader>U", ":PlugUpdate | PlugUpgrade<CR>", silent) --vim-plug update & upgrade

map("n", "<leader>r", ":%s//g<Left><Left>", no_silent) --replace all (normal)
map("v", "<leader>r", ":s//g<Left><Left>", no_silent) --replace all (visual)
map("n", "<leader>o", ':silent !xdg-open "<cWORD>" &<CR>', silent) --open a url under cursor
map("n", "<C-t>", "<cmd>Ex<CR>", silent) -- open file explorer
map("n", "<leader>c", "<cmd>ColorizerToggle<CR>", silent) -- toggle colorizer

map("n", "<leader><leader>", "<Plug>(artio-files)", no_silent)
map("n", "<leader>fg", "<Plug>(artio-grep)", no_silent)

-- smart file picker
map("n", "<leader>ff", "<Plug>(artio-smart)", no_silent)

-- general built-in pickers
map("n", "<leader>fh", "<Plug>(artio-helptags)", no_silent)
map("n", "<leader>fb", "<Plug>(artio-buffers)", no_silent)
map("n", "<leader>f/", "<Plug>(artio-buffergrep)", no_silent)
map("n", "<leader>fo", "<Plug>(artio-oldfiles)", no_silent)

map("n", "<leader>u", vim.cmd.Undotree, silent)
