M = {}

local function check(id)
  if id == 0 then
    print('EDITOR ERROR WHILE COMPILING')
  end
  return id
end

M.compile = function()
  local saved = vim.g.COMPILE_COMMAND or ''
  local command = check(vim.fn.input({ prompt = 'compile command: ', default = saved, cancelreturn = false }))

  if not command then
    print('compiling aborted')
    return
  end

  vim.g.COMPILE_COMMAND = command

  local width = vim.api.nvim_win_get_width(0)
  local height = vim.api.nvim_win_get_height(0)
  local ratio = 0.8

  local buf = check(vim.api.nvim_create_buf(true, true))
  local win = check(vim.api.nvim_open_win(buf, true, {
    width = require('math').floor(width * ratio),
    height = require('math').floor(height * ratio),
    relative = 'editor',
    row = 0.5 * height - height * ratio / 2,
    col = 0.5 * width - width * ratio / 2,
    style = 'minimal',
    border = 'single',
  }))

  local success, err = pcall(vim.fn.termopen, vim.split(command, ' '))
  if not success then
    vim.api.nvim_win_close(win, true)
    error('invalid compile command ' .. command)
  end
end

return M
