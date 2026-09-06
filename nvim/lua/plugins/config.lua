require('nvim-autopairs').setup {
    disable_in_macro = true,
}

-- require('jule').setup {
--   format_on_save = true,
--   enable_cmp = true,
-- }

-- require('cord').setup {
--   display = {
--     theme = 'default',
--     flavor = 'accent',
--   },

--   editor = {
--     client = 'neovim',
--     tooltip = 'I am a [BIG SHOT]',
--     icon = nil,
--   },
-- }


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

-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     section_separators = { left = '', right = ''},
--     always_divide_middle = true,
--     always_show_tabline = true,
--     globalstatus = false,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
-- }

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


local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
-- TODO make it not hardcoded
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#D2717F" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F4D29B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#86ADCC" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#E9AB8C" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#EDFDE2" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C7B8E1" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#BFE4DF" })
end)

require("ibl").setup { indent = { highlight = highlight } }

-- undotree
vim.cmd.packadd("nvim.undotree")

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("state") .. "/undodir"
vim.o.undofile = true

vim.o.hidden = true
vim.o.sessionoptions = "help,tabpages,winsize"


-- lastplace
require("lastplace").setup({
  -- Filetypes to ignore
  ignore_filetypes = {
    "gitcommit", "gitrebase", "svn", "hgcommit", "xxd", "COMMIT_EDITMSG"
  },

  -- Buffer types to ignore  
  ignore_buftypes = {
    "quickfix", "nofile", "help", "terminal"
  },

  -- Center cursor after jumping
  center_on_jump = true,

  -- Only jump if target line is not visible
  jump_only_if_not_visible = false,

  -- Minimum lines required to enable jumping
  min_lines = 10,

  -- Maximum line to jump to (0 = no limit)
  max_line = 0,

  -- Open folds after jumping
  open_folds = true,

  -- Enable debug messages
  debug = false,
})

-- gitsigns
require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})
