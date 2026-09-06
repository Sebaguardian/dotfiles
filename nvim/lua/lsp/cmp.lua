vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })

local icons = require("mini.icons")

require("blink.cmp").setup({
  cmdline = {
    enabled = true,
    completion = {
      menu = {
        auto_show = true,
        draw = { columns = { { "label", "label_description", gap = 1 } } },
      },
      list = { selection = { preselect = false } },
    },
  },

  completion = {
    documentation = { auto_show = true },
    menu = {
      scrolloff = 0,
      border = "none",

      draw = {
        align_to = "label",
        padding = 1,
        gap = 2,
        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
        components = {
          kind_icon = {
            text = function(ctx)
              if ctx.kind == "Color" then
                ctx.kind_icon = "󱓻"
              end
              return ctx.kind_icon .. ctx.icon_gap
            end,
            highlight = function(ctx)
              local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
              return hl
            end,
          },
          kind = {
            text = function(ctx)
              return string.format("(%s)", ctx.kind)
            end,
            highlight = function(ctx)
              local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
              return hl
            end,
          },
        },
      },
    },
  },

  sources = {
    default = { "lsp", "buffer", "path" },
    per_filetype = { jule = { "jule" } },
  },

  keymap = {
    preset = "none",
    ["<C-CR>"] = { "show", "show_documentation", "hide_documentation" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<C-i>"] = { "scroll_documentation_up" },
    ["<C-e>"] = { "scroll_documentation_down" },
  },

  appearance = {
    kind_icons = {
      Class = icons.get("lsp", "class"),
      Color = icons.get("lsp", "color"),
      Constant = icons.get("lsp", "constant"),
      Constructor = icons.get("lsp", "constructor"),
      Enum = icons.get("lsp", "enum"),
      EnumMember = icons.get("lsp", "enummember"),
      Event = icons.get("lsp", "event"),
      Field = icons.get("lsp", "field"),
      File = icons.get("lsp", "file"),
      Folder = icons.get("lsp", "folder"),
      Function = icons.get("lsp", "function"),
      Interface = icons.get("lsp", "interface"),
      Keyword = icons.get("lsp", "keyword"),
      Method = icons.get("lsp", "method"),
      Module = icons.get("lsp", "module"),
      Operator = icons.get("lsp", "operator"),
      Property = icons.get("lsp", "property"),
      Reference = icons.get("lsp", "reference"),
      Snippet = icons.get("lsp", "snippet"),
      Struct = icons.get("lsp", "struct"),
      Text = icons.get("lsp", "text"),
      TypeParameter = icons.get("lsp", "typeparameter"),
      Unit = icons.get("lsp", "unit"),
      Value = icons.get("lsp", "value"),
      Variable = icons.get("lsp", "variable"),
    },
  },
})

-- local cmp = require('blink.cmp')
--
-- cmp.build():pwait()
-- cmp.setup()


