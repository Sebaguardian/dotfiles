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

map("n", "<leader>P", ":PlugInstall<CR>", silent) --vim-plug install
map("n", "<leader>U", ":PlugUpdate | PlugUpgrade<CR>", silent) --vim-plug update & upgrade

map("n", "<leader>r", ":%s//g<Left><Left>", no_silent) --replace all (normal)
map("v", "<leader>r", ":s//g<Left><Left>", no_silent) --replace all (visual)
map("n", "<leader>o", ':silent !xdg-open "<cWORD>" &<CR>', silent) --open a url under cursor
map("n", "<C-t>", "<cmd>Ex<CR>", silent) -- open file explorer
map("n", "<leader>c", "<cmd>ColorizerToggle<CR>", silent) -- toggle colorizer

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", no_silent)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", no_silent)
