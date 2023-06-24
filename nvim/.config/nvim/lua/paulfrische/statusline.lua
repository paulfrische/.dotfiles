local M = {}
local st = ''

M.mode = function()
  local currentmode = {
    n           = 'NORMAL',
    v           = 'VISUAL',
    V           = 'V·Line',
    ['\\<C-V>'] = 'V·Block',
    i           = 'INSERT',
    R           = 'R',
    Rv          = 'V·Replace',
    c           = 'Command',
  }

  return '  ' .. currentmode[vim.fn.mode()] .. '  '
end

-- highlight
st = st .. '%#CursorLine#'
-- mode
st = st .. '%#search#%{v:lua.require("paulfrische.statusline").mode()}%#CursorLine#'
-- path
st = st .. '%=%f'
-- buffer number
st = st .. ' %n'
-- line numbers
st = st .. '%=%l/%L (%p)'

local g = vim.api.nvim_create_augroup('statusbar-custom', {})
vim.api.nvim_create_autocmd({ 'ModeChanged', 'CursorHoldI' }, {
  group = g,
  callback = function ()
    vim.cmd.redraw()
  end
})

vim.opt.statusline = st

return M
