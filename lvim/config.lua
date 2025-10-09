-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

--[[

 _ .__|_ 
(_)|_)|_ 
   |     

--]]

lvim.builtin.lualine.style = "lvim"
vim.o.timeoutlen = 300 -- miliseconds
lvim.colorscheme = "cuddlefish"
-- lvim.builtin.which_key.opts.window.delay = 0.5 -- seconds??

vim.opt.mouse=""
vim.opt.shiftwidth = 8
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4

-- keybindings --
vim.keymap.set("n", "<C-UP>", "<cmd>m .-2<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-DOWN>", "<cmd>m .+1<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<Space>k", "<cmd>ShowkeysToggle<cr>", { noremap = true, silent = false})

--[[

._ |    _ o._  _ 
|_)||_|(_||| |_> 
|       _|       

]]

lvim.plugins = {
  {
  "comfysage/cuddlefish.nvim",
  config = function()
    require('cuddlefish').setup({
      theme = {
        accent = 'violet',
      },
      editor = {
        transparent_background = false,
      },
      style = {
        tabline = { 'reverse' },
        search = { 'italic', 'reverse' },
        incsearch = { 'italic', 'reverse' },
        types = { 'italic' },
        keyword = { 'italic' },
        comment = { 'italic' },
      },
      -- overrides = function(colors)
      --   return {}
      -- end,
    })

  end

  },
  {
  "vyfor/cord.nvim",
  build = ':Cord update',
  opts = {
                display = {
                        theme = "catppuccin",
                        flavor = "accent"
                        }
        }
  },
  { "wakatime/vim-wakatime", lazy = false },
  { "nvzone/showkeys", cmd = "ShowkeysToggle", opts = { maxkeys = 5}}
}

-- Silence the specific position encoding message
local notify_original = vim.notify
vim.notify = function(msg, ...)
  if
    msg
    and (
      msg:match 'position_encoding param is required'
      or msg:match 'Defaulting to position encoding of the first client'
      or msg:match 'multiple different client offset_encodings'
    )
  then
    return
  end
  return notify_original(msg, ...)
end
