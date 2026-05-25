-- vim.lsp.enable 'lua_ls'

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(ev)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'LSP: Goto Definition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'LSP: Goto Declaration' })
    -- vim.keymap.set('n', '[g', vim.lsp.diagnostic.goto_prev, { buffer = ev.buf, desc = 'LSP: Goto Next Diagnostic' })
    -- vim.keymap.set('n', ']g', vim.lsp.diagnostic.goto_next, { buffer = ev.buf, desc = 'LSP: Goto Prev Diagnostic' })
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { buffer = ev.buf, desc = 'LSP: Format' })

    -- toggle diagnostics
    vim.keymap.set(
      'n',
      '<leader>lt',
      (function()
        local diag_status = 1 -- 1 is show; 0 is hide
        return function()
          if diag_status == 1 then
            diag_status = 0
            vim.diagnostic.config { underline = false, virtual_text = false, signs = false, update_in_insert = false }
          else
            diag_status = 1
            vim.diagnostic.config { underline = true, virtual_text = true, signs = true, update_in_insert = true }
          end
        end
      end)(),
      { buffer = ev.buf, desc = 'LSP: Toggle diagnostics display' }
    )

    -- folding
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.supports_method 'textDocument/foldingRange' then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end

    -- Highlight words under cursor
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) and vim.bo.filetype ~= 'bigfile' then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = ev.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = ev.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
          -- vim.cmd 'setl foldexpr <'
        end,
      })
    end

    -- show diagnostics
    vim.keymap.set('n', '<leader>ld', function()
      vim.diagnostic.open_float { source = true }
    end, { buffer = ev.buf, desc = 'LSP: Show Diagnostic' })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
      callback = function(event)
        vim.lsp.buf.clear_references()
        vim.api.nvim_create_autocmd { group = 'lsp-detach', buffer = event.buf }
      end
    })
  end
})

-- diagnostic UI touches
-- vim.diagnostic.config {
--   -- virtual_lines = { current_line = true },
--   virtual_text = {
--     spacing = 5,
--     prefix = '◍ ',
--   },
--   float = { severity_sort = true },
--   severity_sort = true,
--   signs = {
--     text = {
--       -- [vim.diagnostic.severity.ERROR] = '',
--       [vim.diagnostic.severity.ERROR] = '',
--       [vim.diagnostic.severity.WARN] = '',
--       [vim.diagnostic.severity.INFO] = '',
--       [vim.diagnostic.severity.HINT] = '',
--     },
--     numhl = {
--       [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
--       [vim.diagnostic.severity.WARN] = 'DiagnosticWarning',
--       [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
--       [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
--     },
--   },
-- }

-- 诊断信息设置
-- 查看 :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ", -- 这里配置“错误”的图标，需要nerd font字体
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

-- keymap for jump
vim.keymap.set(
  "n",
  "[h",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.HINT, count = -1 } end,
  { desc = "Previous hint" }
)
vim.keymap.set(
  "n",
  "]h",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.HINT, count = 1 } end,
  { desc = "Next hint" }
)
vim.keymap.set(
  "n",
  "[i",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.INFO, count = -1 } end,
  { desc = "Previous info" }
)
vim.keymap.set(
  "n",
  "]i",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.INFO, count = 1 } end,
  { desc = "Next info" }
)
vim.keymap.set(
  "n",
  "[w",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.WARN, count = -1 } end,
  { desc = "Previous warning" }
)
vim.keymap.set(
  "n",
  "]w",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.WARN, count = 1 } end,
  { desc = "Next warning" }
)
vim.keymap.set(
  "n",
  "[g",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.ERROR, count = -1 } end,
  { desc = "Previous error" }
)
vim.keymap.set(
  "n",
  "]g",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.ERROR, count = 1 } end,
  { desc = "Next error" }
)

-- 当光标处有诊断信息时自动显示
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
      border = "rounded",
      scope = "cursor",
    })
  end,
})
