require('nvim-autopairs').setup {
    disable_in_macro = true,
}

require('jule').setup {
  format_on_save = true,
  enable_cmp = true,
}

require('cord').setup {
  display = {
    theme = 'default',
    flavor = 'accent',
  },

  editor = {
    client = 'neovim',
    tooltip = 'I am a [BIG SHOT]',
    icon = nil,
  },
}


require('smear_cursor').setup({
    cursor_color = '#e0def4',
})

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 450,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = ''},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}

require('Comment').setup({
    toggler = {
        ---Line-comment toggle keymap
        line = '<C-/>',
    },
        opleader = {
        ---Block-comment keymap
        line = '<C-/>',
    },
})

require("colorizer").setup{}
