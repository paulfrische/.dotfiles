---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-context' },
  },
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'c', 'vim', 'vimdoc', 'query' },
      auto_install = true,
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ['af'] = {
              query = '@function.outer',
              desc = 'select function [outer]',
            },
            ['if'] = {
              query = '@function.inner',
              desc = 'select function [inner]',
            },
            ['ac'] = {
              query = '@class.outer',
              desc = 'select class [outer]',
            },
            ['ic'] = {
              query = '@class.inner',
              desc = 'select class [inner]',
            },
          },
        },
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })

    require('treesitter-context').setup({})
  end,
}
