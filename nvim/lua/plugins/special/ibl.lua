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
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#EB6F92" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F6C177" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#9CCFD8" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#EBBCBA" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#31748F" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C4A7E7" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#9CCFD8" })
end)

require("ibl").setup { indent = { highlight = highlight } }
