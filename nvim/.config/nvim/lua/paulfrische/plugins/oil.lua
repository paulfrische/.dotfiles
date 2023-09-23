return {
  'stevearc/oil.nvim',
  lazy = false,
  config = function()
    require('oil').setup()
    local map = require('paulfrische.util').map
    map('n', '<leader>x', ':Oil<cr>', 'Open Oil')
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
