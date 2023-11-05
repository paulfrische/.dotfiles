return {
  'freddiehaddad/feline.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim/',
  },
  config = function()
    local components = require('paulfrische.plugins.feline.config').components
    local properties = require('paulfrische.plugins.feline.config').properties

    require('feline').setup({
      properties = properties,
      components = components,
      theme = require('paulfrische.color').theme,
    })
    require('feline').winbar.setup({})
  end,
}
