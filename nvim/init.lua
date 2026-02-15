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
  virtual_text = false,
  virtual_lines = {
      current_line = true,
  },
  update_in_insert = true,
}

vim.g.rustfmt_autosave = 1

vim.o.exrc = true

vim.o.grepprg = "grep -rni --"
vim.o.grepformat = "%f:%l:%c:%m"

-- require("vim._extui").enable({ enable = true, msg = { target = "msg" } })

require('keymaps')
require('plugins/load')
require('plugins/config')
require('plugins/special')
require('lsp')

vim.cmd.colorscheme('rose-pine')

