local color = require('paulfrische.color')
return {
  lazy = false,
  'rebelot/kanagawa.nvim',
  enabled = color.theme == color.themes.KANAGAWA,
  config = function()
    require('kanagawa').setup({})
    vim.cmd.colorscheme('kanagawa-dragon')
  end,
}
