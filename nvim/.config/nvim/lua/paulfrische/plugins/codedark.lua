return {
  enabled = require('paulfrische.color').theme == 'codedark',
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').load()
  end,
}
