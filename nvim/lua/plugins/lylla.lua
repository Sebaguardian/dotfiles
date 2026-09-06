require("lylla").setup({
  refresh_rate = 300,
  hls = {
      normal = { link = "MiniIconsAzure" },
      visual = { link = "MiniIconsPurple" },
      command = { link = "MiniIconsOrange" },
      insert = { link = "MiniIconsGrey" },
      replace = { link = "MiniIconsGrey" },
      operator = { link = "NonText" },
  },

  modules = {
    "%<%f %h%w%m%r",
    "%=",
    {
      fn = function()
        if vim.o.showcmdloc == "statusline" then
          return "%-10.S"
        end
        return ""
      end,
    },
    { " " },
    {
      fn = function()
        if not vim.b.keymap_name then
          return ""
        end
        return "<" .. vim.b.keymap_name .. ">"
      end,
    },
    { " " },
    {
      fn = function()
        if vim.bo.busy > 0 then
          return "◐ "
        end
        return ""
      end,
    },
    { " " },
    {
      fn = function()
        if not package.loaded["vim.diagnostic"] then
          return ""
        end
        return vim.diagnostic.status()
      end,
      opts = {
        events = { "DiagnosticChanged" },
      },
    },
    { " " },
    {
      fn = function()
        if not vim.o.ruler then
          return ""
        end
        if vim.o.rulerformat == "" then
          return "%-14.(%l,%c%V%) %P"
        end
        return vim.o.rulerformat
      end,
    },
  },
  winbar = {},
})
