vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.cmdheight = 0
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 6
vim.opt.scrolloff = 8
vim.opt.title = true
vim.opt.list = true
vim.opt.listchars:append('trail:·')
vim.opt.fillchars:append('eob: ')
vim.opt.listchars:append("eol:↴")
vim.opt.undofile = true
vim.opt.colorcolumn = '80'
vim.opt.cursorline = false
vim.opt.updatetime = 300
vim.opt.swapfile = false
vim.opt.signcolumn = "yes:2"
vim.opt.hlsearch = true
vim.opt.guicursor=nil

-- alias :Q to :qa! and :W to :w
vim.api.nvim_create_user_command('Q', 'qa!', {})
vim.api.nvim_create_user_command('W', 'w', {})
