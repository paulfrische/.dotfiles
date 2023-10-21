return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.surround').setup()
    require('mini.align').setup()
    require('mini.splitjoin').setup()
    require('mini.cursorword').setup({
      delay = 1000,
    })
    require('mini.comment').setup()

    require('mini.pairs').setup({
      modes = { command = true },
    })
  end,
}
