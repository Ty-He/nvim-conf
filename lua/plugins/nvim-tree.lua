return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    view = {
      width = 25,
    },
  },
  keys = {
    { '<leader>n', ':NvimTreeToggle<CR>', silent = true },
  },
}
