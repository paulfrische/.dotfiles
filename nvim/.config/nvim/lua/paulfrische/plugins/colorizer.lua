return {
  'norcalli/nvim-colorizer.lua',
  event = 'VimEnter',
  config = function()
    require('colorizer').setup({
      '*',
    }, { mode = 'foreground' })
  end,
}
