local M = {}
local st = ''

M.max_bufs = 5

M.mode = function()
  local currentmode = {
    n = 'NORMAL',
    v = 'VISUAL',
    V = 'V·Line',
    ['\\<C-V>'] = 'V·Block',
    i = 'INSERT',
    R = 'R',
    Rv = 'V·Replace',
    c = 'Command',
  }

  return '  ' .. currentmode[vim.fn.mode()] .. '  '
end

M.buffers = function()
  local function get_name(b)
    local name = vim.api.nvim_buf_get_name(b)
    return vim.fs.basename(name)
  end
  local buffers = vim.api.nvim_list_bufs()
  local current_name = get_name(0)
  local buffers_status = '*' .. current_name .. '*'
  for i, b in pairs(buffers) do
    if i > M.max_bufs then
      break
    end
    local name = get_name(b)
    if name ~= current_name and name ~= '' then
      buffers_status = buffers_status .. ' | ' .. name
    end
  end

  return buffers_status
end

-- highlight
st = st .. '%#CursorLine#'
-- mode
st = st
  .. '%#search#%{v:lua.require("paulfrische.statusline").mode()}%#CursorLine#'
-- buffers
st = st .. '%=%{v:lua.require("paulfrische.statusline").buffers()}'
-- line numbers
st = st .. '%=%l/%L (%p)'

local g = vim.api.nvim_create_augroup('statusbar-custom', {})
vim.api.nvim_create_autocmd({ 'ModeChanged', 'CursorHoldI' }, {
  group = g,
  callback = function()
    vim.cmd.redraw()
  end,
})

vim.opt.statusline = st

return M
