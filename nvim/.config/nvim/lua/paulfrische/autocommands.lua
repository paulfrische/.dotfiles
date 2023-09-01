local custom = vim.api.nvim_create_augroup('Custom', {})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = custom,
  callback = function()
    -- vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = custom,
  pattern = '*',
})

-- Don't auto comment new line
vim.api.nvim_create_autocmd('BufEnter', {
  group = custom,
  command = 'set formatoptions-=cro',
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*/**/lua/*.lua',
  command = '!stylua %',
})
