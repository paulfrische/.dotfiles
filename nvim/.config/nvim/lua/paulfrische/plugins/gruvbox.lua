return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  enabled = require('paulfrische.color').theme == 'gruvbox',
  config = function ()
    require('gruvbox').setup({
      contrast = 'hard'
    })
    vim.cmd.colorscheme('gruvbox')
  end
}
