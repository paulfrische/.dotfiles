local color = require('paulfrische.color')
return {
  'rose-pine/neovim',
  name = 'rose-pine',
  enabled = color.theme == color.themes.ROSE_PINE,
  config = function()
    vim.cmd.colorscheme('rose-pine')
  end,
}
