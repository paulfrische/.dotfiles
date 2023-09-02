local color = require('paulfrische.color')
return {
  enabled = color.theme == color.themes.CODEDARK,
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').load()
  end,
}
