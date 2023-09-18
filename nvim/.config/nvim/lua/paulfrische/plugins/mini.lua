return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.surround').setup()
    require('mini.splitjoin').setup()
    require('mini.cursorword').setup()
    require('mini.comment').setup()

    require('mini.pairs').setup({
      modes = { command = true },
    })
  end,
}
