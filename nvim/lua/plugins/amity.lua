-- name:    amity
-- author:  comfysage
-- license: eupl-1.2

local config = require("evergarden.config").get()
config.editor.transparent_background = false

-- palette ====================================================================
local palette = {
  text = "#F2E1E2",
  subtext1 = "#F0C7CD",
  subtext0 = "#E8B8C5",
  overlay2 = "#CC8C9D",
  overlay1 = "#886F81",
  overlay0 = "#6C586D",
  surface2 = "#5A4A5C",
  surface1 = "#302733",
  surface0 = "#262029",
  base = "#19171D",
  mantle = "#141218",
  crust = "#0F0D12",

  accent = "#FEBDD4",

  red = "#D2717F",
  orange = "#E9AB8C",
  yellow = "#F4D29B",
  lime = "#E9F6CA",
  green = "#EDFDE2",
  aqua = "#BDDEC5",
  skye = "#B1DBC9",
  snow = "#BFE4DF",
  blue = "#86ADCC",
  purple = "#C7B8E1",
  pink = "#F7BAE2",
  cherry = "#FAD9ED",
}

local theme = vim.deepcopy(palette, true)

theme.none = "NONE"
theme.colors = palette
theme.sign = theme.none
theme.comment = theme.overlay1
theme.editor = {
  search = theme.accent,
  incsearch = theme.accent,
  float = theme.colors[config.editor.float.color] or theme.none,
  completion = theme.colors[config.editor.completion.color] or theme.none,
}
theme.syntax = {
  keyword = theme.overlay2,
  identifier = theme.text,
  property = theme.subtext1,
  type = theme.aqua,
  context = theme.overlay1,
  operator = theme.overlay1,
  constant = theme.pink,
  func = theme.purple,
  string = theme.snow,
  macro = theme.skye,
  annotation = theme.cherry,
}
theme.diagnostic = {
  ok = theme.green,
  error = theme.red,
  warn = theme.yellow,
  info = theme.aqua,
  hint = theme.skye,
}
theme.diff = {
  add = theme.green,
  delete = theme.red,
  change = theme.aqua,
}
theme.git = {
  staged = theme.green,
  unstaged = theme.skye,
  ignored = theme.overlay0,
  untracked = theme.subtext1,
}

local hlgroups = require("evergarden.hl").setup(theme, config)
require("evergarden.utils").set_highlights(hlgroups)

vim.g.colors_name = "amity"
