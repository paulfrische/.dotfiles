vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.hlsearch = false

vim.opt.wrap = true

vim.opt.cmdheight = 0

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8

vim.opt.title = true

vim.opt.list = true
vim.opt.listchars:append('trail:·')
vim.opt.fillchars:append('eob: ')

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.cursorline = true

vim.opt.updatetime = 50
vim.opt.signcolumn = 'yes'

vim.opt.guicursor = ''

vim.opt.confirm = true

-- alias :Q to :qa!, :W to :w, :Wq to :wq, :WQ to :wq
vim.api.nvim_create_user_command('Q', 'qa!', {})
vim.api.nvim_create_user_command('W', 'w ++p', {})
vim.api.nvim_create_user_command('Wa', 'wa ++p', {})
vim.api.nvim_create_user_command('WA', 'wa ++p', {})
vim.api.nvim_create_user_command('Wq', 'wq ++p', {})
vim.api.nvim_create_user_command('WQ', 'wq ++p', {})
