return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'UIEnter',
  config = function()
    require('indent_blankline').setup({
      char = '»',
      use_treesitter = true,
      show_end_of_line = true,
    })
  end,
}
