local map = require('paulfrische.util').map

-- put the cursor in the center of the screen when searching/jumping aroundremap
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- deleting/pasting in visualmode without yanking
map('v', 'D', '"_d')
map('v', 'P', '"_dp')

-- remove search highlights in normal mode
map('n', '<ESC>', ':noh<CR>:echo<CR>')

-- code runner
map('n', '<leader>c', ':Jaq<CR>')

-- terminal
map('n', '<leader>t', ':ToggleTerm direction=float<CR>')

-- lazygit
map('n', '<leader>gg', ':LazyGit<CR>')

-- move around text in visual-mode
map('v', '<C-j>', ':m \'>+1<CR>gv=gv')
map('v', '<C-k>', ':m \'<-2<CR>gv=gv')

-- file explorer
map('n', '<leader>x', ':NvimTreeToggle<CR>')

-- no neck pain
map('n', '<leader>z', ':ZenMode<CR>')

-- escape terminal
map('t', '<ESC>', '<C-\\><C-n>')

-- splits
map('n', '<M-h>', '<C-w>h')
map('n', '<M-j>', '<C-w>j')
map('n', '<M-k>', '<C-w>k')
map('n', '<M-l>', '<C-w>l')
map('n', '<leader>h', '<cmd>split<CR>')
map('n', '<leader>v', '<cmd>vsplit<CR>')

-- buffers
map('n', '<M-n>', '<cmd>bnext<CR>')
map('n', '<M-p>', '<cmd>bprevious<CR>')

-- add current dir to rtp
map('n', '<leader>r', ':set rtp+=.<CR>')
