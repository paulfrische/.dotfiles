local M = {}

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

M.toggle_inlay_hints = function()
  vim.lsp.inlay_hint(0, nil)
end

---@diagnostic disable-next-line: unused-local
M.attach = function(client, buffnr)
  -- local bufmap = require('paulfrische.util').bufmap
  local map = require('paulfrische.util').map

  map('n', '<leader>i', M.toggle_inlay_hints)

  -- Displays hover information about the symbol under the cursor
  map('n', 'K', vim.lsp.buf.hover)

  -- Jump to the definition
  map('n', 'gd', vim.lsp.buf.definition)

  -- Jump to declaration
  map('n', 'gD', vim.lsp.buf.declaration)

  -- Lists all the implementations for the symbol under the cursor
  map('n', 'gi', '<cmd>Trouble lsp_implementations<cr>')

  -- Jumps to the definition of the type symbol
  map('n', 'go', '<cmd>Trouble lsp_definitions<cr>')

  -- Lists all the references
  map('n', 'gr', '<cmd>Trouble lsp_references<cr>')

  -- Displays a function's signature information
  map('n', 'gs', vim.lsp.buf.signature_help)

  -- Show diagnostics in a floating window
  map('n', 'gl', vim.diagnostic.open_float)

  -- Move to the previous diagnostic
  map('n', '[d', vim.diagnostic.goto_prev)

  -- Move to the next diagnostic
  map('n', ']d', vim.diagnostic.goto_next)

  -- rename
  map('n', 'gn', vim.lsp.buf.rename)

  -- diagnostics
  map('n', 'ge', require('trouble').open)

  -- format buffer
  map('n', 'gf', vim.lsp.buf.format)

  -- code actions
  map({ 'n', 'v' }, '<M-CR>', vim.lsp.buf.code_action)
  map({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action)

  if client.server_capabilities.inlayHintProvider.resolveProvider then
    M.toggle_inlay_hints()
  end

  -- if you want to set up formatting on save, you can use this as a callback
  local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

M.setup = function()
  require('neodev').setup({})

  require('paulfrische.plugins.lsp.cmp').setup({
    border = '',
  })

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
