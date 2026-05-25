vim.g.mapleader = ','

-- vim.keymap.set("n", "<C-a>b", "<Cmd>lua print('hello, world')<CR>", {silent = true})
vim.keymap.set("n", "<C-a>b", function ()
  print("hi")
end, {silent = true})

vim.keymap.set('n', '<A-h>', "<C-w>h", {noremap = true, silent = true})
vim.keymap.set('n', '<A-j>', "<C-w>j", {noremap = true, silent = true})
vim.keymap.set('n', '<A-k>', "<C-w>k", {noremap = true, silent = true})
vim.keymap.set('n', '<A-l>', "<C-w>l", {noremap = true, silent = true})

vim.keymap.set('n', ';', "0", {noremap = true, silent = true})
vim.keymap.set('n', "'", "$", {noremap = true, silent = true})

vim.keymap.set('n', '<leader><space>', '<cmd>nohl<CR>', {noremap = true})
