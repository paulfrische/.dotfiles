local function OPEN_OIL()
  require('oil').open()
end

return {
  'stevearc/oil.nvim',
  keys = {
    { '<leader>x', OPEN_OIL, desc = 'open oil' },
  },
  opts = {},
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
