return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup()
    require('paulfrische.util').map('n', '<leader>x', require('oil').open)
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
