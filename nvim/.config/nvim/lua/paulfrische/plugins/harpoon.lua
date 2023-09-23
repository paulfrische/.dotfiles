return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- use Ctrl as prefix for harpoon
    local map = require('paulfrische.util').map
    map('n', '<C-a>', require('harpoon.mark').add_file)
    map('n', '<C-n>', require('harpoon.ui').nav_next)
    map('n', '<C-p>', require('harpoon.ui').nav_prev)
    map('n', '<C-m>', require('harpoon.ui').toggle_quick_menu)
  end,
}
