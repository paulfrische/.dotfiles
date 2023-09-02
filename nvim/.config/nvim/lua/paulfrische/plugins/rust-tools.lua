return {
  'simrat39/rust-tools.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  ft = 'rust',
  config = function()
    local rt = require('rust-tools')
    local mason_registry = require('mason-registry')

    local codelldb = mason_registry.get_package('codelldb')
    local extension_path = codelldb:get_install_path() .. '/extension/'

    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

    rt.setup({
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
          codelldb_path,
          liblldb_path
        ),
      },
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    })
  end,
}
