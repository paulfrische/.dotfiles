---@diagnostic disable: missing-fields
local M = {}

M.sources = {
  { name = 'neorg' },
  { name = 'nvim_lsp', priority = 1000 },
  { name = 'luasnip',  keyword_length = 2 },
  { name = 'crates' },
  { name = 'emoji' },
  { name = 'path' },
}

M.formatting = {
  fields = { 'abbr', 'kind', 'menu' },
  format = require('lspkind').cmp_format({
    mode = 'symbol_text',
  }),
}

M.setup = function(options)
  local border = options.border or 'single'
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = '',
    })
  end

  sign({ name = 'DiagnosticSignError', text = '✘' })
  sign({ name = 'DiagnosticSignWarn', text = '▲' })
  sign({ name = 'DiagnosticSignHint', text = '⚑' })
  sign({ name = 'DiagnosticSignInfo', text = '' })

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    serverity_sort = true,
  })

  local cmp = require('cmp')
  local luasnip = require('luasnip')

  -- load custom snippets
  require('luasnip.loaders.from_vscode').lazy_load()

  local select_opts = { behavior = cmp.SelectBehavior.Select }

  cmp.setup({
    sources = M.sources,

    window = {
      completion = { border = border },
      documentation = { border = border },
    },

    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    formatting = M.formatting,

    mapping = {
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      -- use C-n to trigger completion too
      ['<C-n>'] = function(_)
        if cmp.visible() then
          cmp.select_next_item(select_opts)
        else
          cmp.complete()
        end
      end,
    },

    experimental = {
      ghost_text = true,
    },
  })
end

return M
