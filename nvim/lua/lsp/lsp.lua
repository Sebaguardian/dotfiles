vim.lsp.config['lua_ls'] = {
 -- Command and arguments to start the server.
 cmd = { 'lua-language-server' },
 -- Filetypes to automatically attach to.
 filetypes = { 'lua' },
 -- Sets the "workspace" to the directory where any of these files is found.
 -- Files that share a root directory will reuse the LSP server connection.
 -- Nested lists indicate equal priority, see |vim.lsp.Config|.
 root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
 -- Specific settings to send to the server. The schema is server-defined.
 -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
 settings = {
   Lua = {
     runtime = {
       version = 'LuaJIT',
     }
   }
 }
}

vim.lsp.config('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
            },
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        },
    },
})

local clangd_opts = {}

if not vim.lsp.is_enabled('clangd') then
  vim.lsp.enable("clangd", clangd_opts)
end

vim.lsp.config('gopls', {
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
})

vim.lsp.config.bashls = {
  cmd = { 'bash-language-server', 'start'},
  filetypes = { 'bash', 'sh', 'zsh' }
}

vim.lsp.enable({
  'lua_ls',
  'rust_analyzer',
  'clangd',
  'gopls',
  'bashls',
})
