return {
  'mason-org/mason.nvim',
  event = 'VeryLazy',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('mason').setup()
    local registry = require('mason-registry')

    local function setup_ls (mason_ls_name, lspconfig_name, conf)
      local success, package = pcall(registry.get_package, mason_ls_name)
      if not success then
        vim.notify(string.format('Fail to find Mason package: %s', mason_ls_name), vim.log.levels.ERROR)
        return
      end
      if success and not package:is_installed() then
        vim.notify(string.format('install %s via Mason', mason_ls_name), vim.log.levels.INFO)
        package:install()
      end
      vim.lsp.config(lspconfig_name, conf or {})
      vim.lsp.enable(lspconfig_name)
    end

    -- lua
    setup_ls('lua-language-server', 'lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'}
            }
          }
        }
    })

    -- go
    setup_ls('gopls', 'gopls')

  end
}
