return {
  'ThePrimeagen/harpoon',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    -- use ALT/META as prefix for harpoon
    local map = require('paulfrische.util').map
    map('n', '<M-a>', require('harpoon.mark').add_file)
    map('n', '<M-n>', require('harpoon.ui').nav_next)
    map('n', '<M-p>', require('harpoon.ui').nav_prev)
    map('n', '<M-m>', require('harpoon.ui').toggle_quick_menu)
  end
}
