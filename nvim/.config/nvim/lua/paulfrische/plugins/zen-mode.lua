return {
  'folke/zen-mode.nvim',
  dependencies = { 'folke/twilight.nvim' },
  cmd = 'ZenMode',
  event = 'UIEnter',
  opts = {
    plugins = {
      twilight = { enabled = false },
    },
  },
}
