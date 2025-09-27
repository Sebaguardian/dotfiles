require('plugins/load')
require('plugins/config')
require('plugins/special')
require('keymaps')
require('lsp')
-- require('lsp/idk')
-- require('lsp/rbullshi')
-- require('lsp/completion')

local options = {
    
    number = true,
    relativenumber = true,
    
    expandtab = true,
    termguicolors = true,

    tabstop = 4,
    shiftwidth = 4,
    scrolloff = 4,
    sidescrolloff = 4,
}

-- set option to given values
for option, value in pairs(options) do
    vim.opt[option] = value
end

vim.g.rustfmt_autosave = 1

vim.cmd.colorscheme('rose-pine')
