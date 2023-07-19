return {
  'nyoom-engineering/oxocarbon.nvim',
  lazy = false,
  priority = 1000,
  enabled = false,
  config = function ()
    vim.cmd.colorscheme('oxocarbon')
  end
}
