return {
  'folke/zen-mode.nvim',
  dependencies = { 'folke/twilight.nvim' },
  cmd = 'ZenMode',
  event = 'UIEnter',
  config = function()
    require('zen-mode').setup({
      plugins = {
        twilight = { enabled = false },
      },
    })

    vim.cmd('ZenMode')
  end,
}
