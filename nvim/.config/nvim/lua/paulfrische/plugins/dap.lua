return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local dap = require('dap')
    local dap_ui = require('dapui')
    local map = require('paulfrische.util').map

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

    dap_ui.setup()
  end
}
