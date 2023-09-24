local function NG()
  require('neogit').open({ kind = 'tab' })
end

local function NG_COMMIT()
  require('neogit').open({ 'commit', kind = 'vsplit' })
end

return {
  'NeogitOrg/neogit',
  keys = {
    { '<leader>gg', NG, desc = 'open Neogit' },
    { '<leader>gc', NG_COMMIT, desc = 'open Neogit' },
  },
  cmd = {
    'Neogit',
  },
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'nvim-telescope/telescope.nvim', -- optional
    'sindrets/diffview.nvim', -- optional
  },
  config = true,
}
