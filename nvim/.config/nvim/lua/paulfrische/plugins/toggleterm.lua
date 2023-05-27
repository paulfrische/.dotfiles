return {
  'akinsho/toggleterm.nvim',
  cmd = 'ToggleTerm',
  keys = { '<leader>t', '<leader>r' },
  config = function()
    require('toggleterm').setup()
  end,
}
