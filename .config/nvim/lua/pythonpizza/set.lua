vim.o.clipboard = 'unnamedplus'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.ignorecase = true
vim.o.wrap = false

vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.scrolloff = 10
vim.wo.numberwidth = 4
vim.wo.scrolloff = 8

vim.opt.list = true
vim.opt.listchars:append('trail:·')
vim.opt.undofile = true
vim.opt.colorcolumn = '80'
vim.opt.guicursor = nil
vim.opt.termguicolors = true
vim.opt.updatetime = 50

vim.b.swapfile = false

vim.cmd([[ set guifont="UbuntuMono Nerd Font Mono":h12]])

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
