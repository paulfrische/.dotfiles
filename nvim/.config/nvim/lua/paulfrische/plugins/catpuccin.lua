local color = require('paulfrische.color')
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  enabled = color.theme == color.themes.CATPUCCIN,
  config = function()
    vim.cmd.colorscheme('catppuccin-mocha')
  end,
}
