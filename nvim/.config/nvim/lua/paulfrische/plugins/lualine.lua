return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    local lazy_status = require('lazy.status')
    local lualine = require('lualine')

    lualine.setup({
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename' },
        lualine_x = { { lazy_status.updates, cond = lazy_status.has_updates } },
        lualine_y = { 'diagnostics' },
        lualine_z = {},
      },
    })
  end,
}
