return {
  'lvimuser/lsp-inlayhints.nvim',
  branch = 'anticonceal',
  config = function ()
    require('lsp-inlayhints').setup()
  end
}
