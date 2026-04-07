return {
  "ibhagwan/fzf-lua",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    { '<leader>ff', ':FzfLua files<CR>', silent = true },
    { '<leader>fb', ':FzfLua buffers<CR>', silent = true },
    { '<leader>fg', ':FzfLua grep<CR>', silent = true },
    { '<leader>fh', ':FzfLua history<CR>', silent = true },
  }
}
