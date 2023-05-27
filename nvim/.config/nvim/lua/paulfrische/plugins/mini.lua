return {
  'echasnovski/mini.nvim',
  event = 'VimEnter',
  config = function()
    require('mini.surround').setup()
    require('mini.comment').setup()
  end,
}
