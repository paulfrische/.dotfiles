vim.g.mapleader = ' '

-- put the cursor in the center of the screen when searching/jumping around
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})

-- remove search highlights in normal mode
vim.keymap.set('n', '<ESC>', ':noh<CR>:echo<CR>', {})

vim.keymap.set('n', '<leader>g', ':LazyGit<CR>', {})

-- compile/run code faster
vim.keymap.set('n', '<leader>c', function()
    require('compit').run({})
end, {})

-- move around text in visual-mode
vim.keymap.set('v', '<C-j>', ':m \'>+1<CR>gv=gv', {})
vim.keymap.set('v', '<C-k>', ':m \'<-2<CR>gv=gv', {})
