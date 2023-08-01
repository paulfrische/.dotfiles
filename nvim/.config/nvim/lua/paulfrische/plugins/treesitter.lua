return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/playground' },
    { 'mrjones2014/nvim-ts-rainbow' },
    { 'nvim-treesitter/nvim-treesitter-context' },
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'rust', 'python', 'html', 'css', 'comment' },
      sync_install = true,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      playground = {
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
