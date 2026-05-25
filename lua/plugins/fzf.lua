return {
  "ibhagwan/fzf-lua",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    -- files and buffers
    { '<leader>ff', ':FzfLua files<CR>', silent = true },
    { '<leader>fb', ':FzfLua buffers<CR>', silent = true },
    { '<leader>ft', ':FzfLua tabs<CR>', silent = true },
    { '<leader>fg', ':FzfLua grep<CR>', silent = true },
    { '<leader>fh', ':FzfLua history<CR>', silent = true },
    -- lsp
    -- { '<leader>fd', '<cmd>FzfLua lsp_declarations<CR>', silent = true },
    { '<leader>fr', '<cmd>FzfLua lsp_references<CR>', silent = true },
    { '<leader>fs', '<cmd>FzfLua lsp_document_symbols<CR>', silent = true },
    -- { '<leader>fw', '<cmd>FzfLua lsp_workspace_symbols<CR>', silent = true },
    { '<leader>fi', '<cmd>FzfLua lsp_live_workspace_symbols<CR>', silent = true },
  }
}
