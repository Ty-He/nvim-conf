vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.colorcolumn = "100"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0

-- vim.opt.autoread = true

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.background = 'light'

vim.opt.jumpoptions = 'stack'

vim.opt.winborder = 'rounded'

local ssh_tty = vim.fn.getenv('SSH_TTY')
if ssh_tty ~= vim.NIL then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end

require('config.keymap')
require('config.lazy')
require('config.lsp')
-- print("Hello, ty!")
