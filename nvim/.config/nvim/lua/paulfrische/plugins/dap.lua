return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'williamboman/mason.nvim',
    'mfussenegger/nvim-dap',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require('dap')
    local dap_ui = require('dapui')
    local map = require('paulfrische.util').map

    local mason_dap = require('mason-nvim-dap')
    mason_dap.setup({
      ensure_installed = {
        'codelldb',
      },
    })

    dap.listeners.after.event_initialized.dapui_config = function()
      dap_ui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dap_ui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dap_ui.close()
    end

    map('n', '<leader>dt', '<cmd>DapToggleBreakpoint<cr>')
    map('n', '<leader>dx', '<cmd>DapTerminate<cr>')
    map('n', '<down>', '<cmd>DapStepOver<cr>')
    map('n', '<right>', '<cmd>DapStepInto<cr>')
    map('n', '<left>', '<cmd>DapStepOut<cr>')

    dap_ui.setup()
  end,
}
