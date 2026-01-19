return {
  'mason-org/mason.nvim',
  event = 'VeryLazy',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('mason').setup()
    local registry = require('mason-registry')
    local success, package = pcall(registry.get_package, 'lua-language-server')
    if success and not package:is_installed() then
      package:install()
    end
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim'}
          }
        }
      }
    })
    vim.lsp.enable 'lua_ls'
  end
}
