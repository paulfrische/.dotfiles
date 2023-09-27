local palletes = {
  BLACK_WHITE = {
    base00 = '#101010',
    base01 = '#1f1f1f',
    base02 = '#2f2f2f',
    base03 = '#3f3f3f',
    base04 = '#a0a0a0',
    base05 = '#aaaaaa',
    base06 = '#bababa',
    base07 = '#cacaca',
    base08 = '#dadada',
    base09 = '#adadad',
    base0A = '#fdfdfd',
    base0B = '#dfdfdf',
    base0C = '#fcfcfc',
    base0D = '#fefefe',
    base0E = '#f0f0f0',
    base0F = '#e0e0e0',
  },

  EXAMPLE = {
    base00 = '#112641',
    base01 = '#3a475e',
    base02 = '#606b81',
    base03 = '#8691a7',
    base04 = '#d5dc81',
    base05 = '#e2e98f',
    base06 = '#eff69c',
    base07 = '#fcffaa',
    base08 = '#ffcfa0',
    base09 = '#cc7e46',
    base0A = '#46a436',
    base0B = '#9ff895',
    base0C = '#ca6ecf',
    base0D = '#42f7ff',
    base0E = '#ffc4ff',
    base0F = '#00a5c5',
  },
}

return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.surround').setup()
    require('mini.splitjoin').setup()
    require('mini.cursorword').setup()
    require('mini.comment').setup()

    -- require('mini.base16').setup({
    --   palette = palletes.BLACK_WHITE,
    -- })

    require('mini.pairs').setup({
      modes = { command = true },
    })
  end,
}
