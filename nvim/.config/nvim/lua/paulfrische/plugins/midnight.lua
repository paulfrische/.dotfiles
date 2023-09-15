local colors = require('paulfrische.color')
return {
  'dasupradyumna/midnight.nvim',
  enabled = colors.theme == colors.themes.MIDNIGHT,
  config = function()
    require('midnight').setup({
      LspInlayHint = {
        link = 'Comment',
      },
    })
    vim.cmd.colorscheme('midnight')
  end,
}
