return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = {
    'Neorg',
  },
  config = function()
    require('neorg').setup({
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.completion'] = {
          config = {
            engine = 'nvim-cmp',
          },
        }, -- Loads default behaviour
        ['core.keybinds'] = {
          config = {
            default_keybinds = true,
          },
        }, -- Loads default keybinds
        ['core.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes',
            },
            default_workspace = 'notes',
          },
        },
      },
    })
  end,
}
