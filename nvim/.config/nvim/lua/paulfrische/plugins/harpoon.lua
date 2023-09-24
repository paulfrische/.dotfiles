return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- use Ctrl as prefix for harpoon
    local map = require('paulfrische.util').map
    map(
      'n',
      '<leader>ha',
      require('harpoon.mark').add_file,
      'add mark to harpoon'
    )
    map(
      'n',
      '<leader>hn',
      require('harpoon.ui').nav_next,
      'next widow in harpoon'
    )
    map(
      'n',
      '<leader>hp',
      require('harpoon.ui').nav_prev,
      'prev widow in harpoon'
    )
    map(
      'n',
      '<leader>hm',
      require('harpoon.ui').toggle_quick_menu,
      'open harpoon gui'
    )
  end,
}
