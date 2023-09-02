local color = require('paulfrische.color')
return {
  'folke/tokyonight.nvim',
  enabled = color.theme == color.themes.TOKYONIGHT,
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true
    local transparent = false
    require('tokyonight').setup({
      transparent = transparent,
      style = 'night',
      styles = {
        floats = transparent and 'transparent',
      },
    })

    vim.cmd.colorscheme('tokyonight')
  end,
}
