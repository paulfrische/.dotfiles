---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'mrjones2014/nvim-ts-rainbow' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-context' },
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'rust', 'python', 'html', 'css' },
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
      rainbow = {
        enable = false,
        extended_mode = true,
        max_file_lines = nil,
      },
    })

    require('treesitter-context').setup({})
  end,
}
