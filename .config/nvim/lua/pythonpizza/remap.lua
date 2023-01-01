vim.g.mapleader = ' '

vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('n', '<ESC>', ':noh<CR>:echo<CR>', {})
vim.keymap.set('n', '<leader>g', ':LazyGit<CR>', {})
vim.keymap.set('n', '<leader>c', function()
    require('compit').run({})
end, {})
