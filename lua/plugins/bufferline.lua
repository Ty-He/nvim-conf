return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      -- diagnostics = 'nvim_lsp',
      mode = 'tabs',
      -- numbers = 'ordinal',
      indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'underline',
      },
      show_buffer_close_icons = false,
      always_show_bufferline = false,
    }
  },
  keys = {
    { '<leader>-', ':BufferLineCyclePrev<CR>', silent = true },
    { '<leader>=', ':BufferLineCycleNext<CR>', silent = true },
    { '<leader>1', ':BufferLineGoToBuffer 1<CR>', silent = true},
    { '<leader>2', ':BufferLineGoToBuffer 2<CR>', silent = true},
    { '<leader>3', ':BufferLineGoToBuffer 3<CR>', silent = true},
    { '<leader>4', ':BufferLineGoToBuffer 4<CR>', silent = true},
    { '<leader>5', ':BufferLineGoToBuffer 5<CR>', silent = true},
    { '<leader>6', ':BufferLineGoToBuffer 6<CR>', silent = true},
    { '<leader>7', ':BufferLineGoToBuffer 7<CR>', silent = true},
    { '<leader>8', ':BufferLineGoToBuffer 8<CR>', silent = true},
    { '<leader>bd', ':bdelete %<CR>', silent = true},
    { '<leader>bp', ':BufferLinePickClose<CR>', silent = true },
  },
  config = function(_, opts)
    vim.opt.termguicolors = true
    require('bufferline').setup(opts)
  end,
  lazy = false,
}
