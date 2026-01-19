vim.opt.number = true
vim.opt.relativenumber = true
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

require('config.keymap')
require('config.lazy')
require('config.lsp')
-- print("Hello, ty!")

