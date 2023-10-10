return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'ThePrimeagen/refactoring.nvim',
  },
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.jq,
        null_ls.builtins.code_actions.refactoring,
      },
    })
  end,
}
