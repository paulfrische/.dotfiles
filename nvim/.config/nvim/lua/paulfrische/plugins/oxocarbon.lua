local color = require('paulfrische.color')
return {
  'nyoom-engineering/oxocarbon.nvim',
  lazy = false,
  priority = 1000,
  enabled = color.theme == color.themes.OXOCARBON,
  config = function()
    vim.cmd.colorscheme('oxocarbon')
  end,
}
