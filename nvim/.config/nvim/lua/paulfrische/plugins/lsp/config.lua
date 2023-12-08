local M = {}

---@diagnostic disable-next-line: unused-local
M.attach = function(client, buffnr)
  local bufmap = require('paulfrische.util').bufmap

  bufmap('n', 'K', vim.lsp.buf.hover)
  bufmap('n', 'gd', vim.lsp.buf.definition)
  bufmap('n', 'gD', vim.lsp.buf.declaration)
  bufmap('n', 'gs', vim.lsp.buf.signature_help)
  bufmap('n', 'gl', vim.diagnostic.open_float)
  bufmap('n', '[d', vim.diagnostic.goto_prev)
  bufmap('n', ']d', vim.diagnostic.goto_next)
  bufmap('n', 'gn', vim.lsp.buf.rename)
  bufmap('n', 'gf', vim.lsp.buf.format)
  bufmap({ 'n', 'v' }, '<M-CR>', vim.lsp.buf.code_action)
  bufmap({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action)
  bufmap('n', '<leader>e', require('trouble').toggle)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(0, true)
  end
end

M.setup = function()
  require('neodev').setup({})

  require('paulfrische.plugins.lsp.cmp').setup({})

  -- require('mason').setup()
  require('mason-lspconfig').setup()

  require('mason-lspconfig').setup({
    ensure_installed = {
      'rust_analyzer',
      'lua_ls',
      'pylsp',
    },
  })

  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config

  lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  require('mason-lspconfig').setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = M.attach,
        capabilities = lsp_defaults.capabilities,
      })
    end,
  })

  -- fix lua_ls
  lspconfig.lua_ls.setup({
    on_attach = M.attach,
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = 'Replace',
        },
        hint = {
          enable = true,
          arrayIndex = 'Disable',
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  -- fix autocomplete etc. for extern libraries
  lspconfig.rust_analyzer.setup({
    on_attach = M.attach,
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  })

  ---@diagnostic disable-next-line: param-type-mismatch
  local python = string.gsub(vim.fn.system('which python3'), '\n', '')

  lspconfig.pylsp.setup({
    on_attach = M.attach,
    settings = {
      pylsp = {
        plugins = {
          jedi = {
            environment = python,
          },
        },
      },
    },
  })
end

return M
