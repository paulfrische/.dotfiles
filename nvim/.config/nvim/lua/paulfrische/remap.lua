local map = require('paulfrische.util').map

-- exit without typing q
map('n', '<leader>e', '<cmd>q<cr>', 'exit without typing q')

-- compiling
map('n', '<leader>c', require('paulfrische.compile').compile, 'compile code')

-- put the cursor in the center of the screen when searching/jumping around
map('n', '<C-d>', '<C-d>zz', 'jump down half a page')
map('n', '<C-u>', '<C-u>zz', 'jump up half a page')
map('n', 'n', 'nzz', 'next search result')
map('n', 'N', 'Nzz', 'previous search result')

-- deleting/pasting in visualmode without yanking
map('v', 'D', '"_d')
map('v', 'P', '"_dp')

-- remove search highlights in normal mode
map('n', '<ESC>', ':noh<CR>:echo<CR>', 'hide search highlight stuff')

-- code runner
-- map('n', '<leader>c', ':Jaq<CR>', 'run code in jaq')

-- terminal
map('n', '<leader>t', ':ToggleTerm direction=float<CR>', 'open floating terminal')

-- lazygit
map('n', '<leader>g', ':LazyGit<CR>', 'open LazyGit')

-- move around text in visual-mode
map('v', '<C-j>', ':m \'>+1<CR>gv=gv')
map('v', '<C-k>', ':m \'<-2<CR>gv=gv')

-- no neck pain
map('n', '<leader>z', ':ZenMode<CR>', 'toggle ZenMode')

-- escape terminal
map('t', '<ESC>', '<C-\\><C-n>')

-- splits
map('n', '<M-h>', '<C-w>h', 'navigate splits like chars')
map('n', '<M-j>', '<C-w>j', 'navigate splits like chars')
map('n', '<M-k>', '<C-w>k', 'navigate splits like chars')
map('n', '<M-l>', '<C-w>l', 'navigate splits like chars')
map('n', '<leader>h', '<cmd>split<CR>', 'open horizontal split')
map('n', '<leader>v', '<cmd>vsplit<CR>', 'open vertical split')

-- buffers
map('n', '<M-n>', '<cmd>bnext<CR>', 'cycle trough buffers')
map('n', '<M-p>', '<cmd>bprevious<CR>', 'cycle trough buffers')

-- notes
map('n', '<leader>n', ':Neorg workspace ')

-- open lazy ui
map('n', '<leader>l', '<cmd>Lazy<cr>')
