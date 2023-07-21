return {
  'akinsho/toggleterm.nvim',
  cmd = 'ToggleTerm',
  keys = { '<leader>t', '<leader>c' },
  config = function()
    require('toggleterm').setup()
  end,
}
