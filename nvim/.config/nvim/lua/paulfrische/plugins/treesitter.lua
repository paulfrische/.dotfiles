return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/playground' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'mrjones2014/nvim-ts-rainbow' },
    { 'nvim-treesitter/nvim-treesitter-context' },
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'rust', 'python', 'html', 'css', 'comment' },
      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = false,
      },

      playground = {
        enable = true,
      },

      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = {
              query = '@function.outer',
              desc = 'Select function head and body',
            },
            ['if'] = {
              query = '@function.inner',
              desc = 'Select function body',
            },
            ['ac'] = {
              query = '@class.inner',
              desc = 'Select class head and body',
            },
            ['ic'] = { query = '@class.inner', desc = 'Select class body' },
          },
        },
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>', -- set to `false` to disable one of the mappings
          node_incremental = '<CR>',
          scope_incremental = '<CR>',
        },
      },
    })

    require('treesitter-context').setup({})
  end,
}
