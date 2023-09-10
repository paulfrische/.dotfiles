return {
  'akinsho/toggleterm.nvim',
  cmd = 'ToggleTerm',
  config = function()
    require('toggleterm').setup()
  end,
}
