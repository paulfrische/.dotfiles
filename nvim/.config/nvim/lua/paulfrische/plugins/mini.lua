return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.surround').setup()
    require('mini.comment').setup()
    require('mini.animate').setup()
  end,
}
