local M = {}


M.toggle_inlay_hints = function()
  vim.lsp.inlay_hint(0, nil)
end

---@diagnostic disable-next-line: unused-local
M.attach = function(client, buffnr)
  local bufmap = require('paulfrische.util').bufmap

  bufmap('n', '<leader>i', M.toggle_inlay_hints)

  -- Displays hover information about the symbol under the cursor
  bufmap('n', 'K', vim.lsp.buf.hover)

  -- Jump to the definition
  bufmap('n', 'gd', vim.lsp.buf.definition)

  -- Jump to declaration
  bufmap('n', 'gD', vim.lsp.buf.declaration)

  -- Lists all the implementations for the symbol under the cursor
  bufmap('n', 'gi',   '<cmd>Trouble lsp_implementations<cr>')

  -- Jumps to the definition of the type symbol
  bufmap('n', 'go',  '<cmd>Trouble lsp_definitions<cr>')

  -- Lists all the references
  bufmap('n', 'gr', '<cmd>Trouble lsp_references<cr>')

  -- Displays a function's signature information
  bufmap('n', 'gs', vim.lsp.buf.signature_help)

  -- Show diagnostics in a floating window
  bufmap('n', 'gl', vim.diagnostic.open_float)

  -- Move to the previous diagnostic
  bufmap('n', '[d', vim.diagnostic.goto_prev)

  -- Move to the next diagnostic
  bufmap('n', ']d', vim.diagnostic.goto_next)

  -- rename
  bufmap('n', 'gn', vim.lsp.buf.rename)

  -- diagnostics
  bufmap('n', 'ge', require('trouble').open)

  -- format buffer
  bufmap('n', 'gf', vim.lsp.buf.format)

  -- code actions
  bufmap({ 'n', 'v' }, '<M-CR>', vim.lsp.buf.code_action)
  bufmap({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action)
end

M.setup = function()
  require('neodev').setup({})

  require('paulfrische.plugins.lsp.cmp').setup({
    border = '',
  })

  require('mason').setup()
  require('mason-lspconfig').setup()

  require('mason-lspconfig').setup({
    ensure_installed = {
      'rust_analyzer',
      'lua_ls',
      'pylsp'
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
          callSnippet = 'Replace'
        },
        hint = {
          enable = true,
          arrayIndex = "Disable",
        },
        telemetry = {
          enable = false
        }
      }
    }
  })

  -- fix autocomplete etc. for extern libraries
  lspconfig.rust_analyzer.setup({
    on_attach = M.attach,
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        }
      }
    }
  })

  local python = string.gsub(vim.fn.system('which python3'), '\n', '')

  lspconfig.pylsp.setup({
    on_attach = M.attach,
    settings = {
      pylsp = {
        plugins = {
          jedi = {
            environment = python,
          }
        }
      }
    }
  })
end

return M
