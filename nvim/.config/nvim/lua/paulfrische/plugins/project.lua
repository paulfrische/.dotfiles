return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup({
      silent_chdir = false,
      ignore_lsp = {
        'lua_ls',
      },
    })
  end,
}
