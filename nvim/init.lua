require('plugins/load')
require('plugins/config')
require('plugins/special')
require('keymaps')
require('lsp')

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

vim.diagnostic.config {
  signs = false,
  underline = true,
  virtual_text = {
    virt_text_pos = "right_align",
    suffix = " ",
  },
  update_in_insert = true,
}

vim.g.rustfmt_autosave = 1

vim.cmd.colorscheme('rose-pine')
