return {
  'nyoom-engineering/oxocarbon.nvim',
  lazy = false,
  priority = 1000,
  enabled = require('paulfrische.color').theme == 'oxocarbon',
  config = function()
    vim.cmd.colorscheme('oxocarbon')
  end,
}
