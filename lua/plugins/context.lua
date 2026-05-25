return {
  "nvim-treesitter/nvim-treesitter-context",
  branch = 'master',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = { 'BufReadPost' },
  opts = {},
  config = function (_, opts)
    local ctx = require('treesitter-context')
    ctx.setup(opts)
    vim.keymap.set('n', '[c', function ()
      ctx.go_to_context(vim.v.count1)
    end)
  end
}
