local color = require('paulfrische.color')
return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  enabled = color.theme == color.themes.GRUVBOX,
  config = function()
    require('gruvbox').setup({
      contrast = 'hard',
      overrides = {
        SignColumn = {
          link = 'Normal',
        },
      },
    })
    vim.cmd.colorscheme('gruvbox')
  end,
}
