return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = false,
  cmd = 'NvimTreeToggle',
  config = function()
    require('nvim-tree').setup()
  end,
}
