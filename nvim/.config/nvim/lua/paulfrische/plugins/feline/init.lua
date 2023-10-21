return {
  'freddiehaddad/feline.nvim',
  config = function()
    local components = require('paulfrische.plugins.feline.config').components
    local properties = require('paulfrische.plugins.feline.config').properties

    require('feline').setup({
      properties = properties,
      components = components,
    })
  end,
}
