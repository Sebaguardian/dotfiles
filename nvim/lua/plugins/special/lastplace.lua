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
