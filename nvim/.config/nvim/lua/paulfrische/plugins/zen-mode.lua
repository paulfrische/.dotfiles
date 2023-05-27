return {
  'folke/zen-mode.nvim',
  dependencies = { 'folke/twilight.nvim' },
  cmd = 'ZenMode',
  config = function()
    require('zen-mode').setup({
      plugins = {
        twilight = { enabled = false },
      },
    })
  end,
}
