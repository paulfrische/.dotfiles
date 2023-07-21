return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'UIEnter',
  config = function()
    require('indent_blankline').setup({
      use_treesitter = false,
      -- show_current_context = true,
    })
  end,
}
