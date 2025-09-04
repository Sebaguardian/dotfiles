local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('rose-pine/neovim', { ['as'] = 'rose-pine' })
Plug('lukas-reineke/indent-blankline.nvim')
Plug('windwp/nvim-autopairs')
Plug('julelang/jule.nvim', { ['branch'] = 'main' })
Plug('vyfor/cord.nvim')
Plug('wakatime/vim-wakatime')
Plug('catgoose/nvim-colorizer.lua')
Plug('OXY2DEV/markview.nvim')
Plug('ya2s/nvim-cursorline')
Plug('sphamba/smear-cursor.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('lewis6991/gitsigns.nvim')
Plug('numToStr/Comment.nvim')

Plug('ssteinbach/vim-pico8-syntax')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

-- Plug('neovim/nvim-lspconfig')
-- Plug('hrsh7th/cmp-nvim-lsp')
-- Plug('hrsh7th/cmp-buffer')
-- Plug('hrsh7th/cmp-path')
-- Plug('hrsh7th/cmp-cmdline')
Plug('L3MON4D3/LuaSnip')
-- Plug('saadparwaiz1/cmp_luasnip')

vim.call('plug#end')
