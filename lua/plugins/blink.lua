return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    'rafamadriz/friendly-snippets'
  },
  event = { 'BufReadPost', 'BufNewFile'},
  opts = {
    completion = {
      menu = { border = 'single' },
      documentation = {
        auto_show = true,
        -- window = { border = 'single' },
      },
      -- ghost_text = {
      --   enabled = true,
      -- },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        }
      },
    },
    keymap = {
      -- preset = 'super-tab'
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<C-y>'] = { 'select_and_accept', 'fallback' },

      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-]>'] = { 'snippet_forward', 'fallback' },
      ['<C-[>'] = { 'snippet_backward', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

    },
    signature = {
      enabled = true,
      -- window = { border = 'single' }
    },
    cmdline = {
      keymap = { preset = 'inherit' },
      completion = {
        menu = { auto_show = true },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          }
        },
      }
    }
  }, -- opts
}
