M = {}

local function check(id)
  if id == 0 then
    print('EDITOR ERROR WHILE COMPILING')
  end
  return id
end

M.compile = function()
  local saved = vim.g.COMPILE_COMMANDS_CUSTOM
  if saved == '' then
    saved = '{}'
  end
  local saved_table = vim.json.decode(saved)
  local command = saved_table[vim.fn.getcwd(0)] or ''

  command = check(vim.fn.input({ prompt = 'compile command: ', default = command, cancelreturn = false }))

  if not command then
    print('compiling aborted')
    return
  else
    saved_table[vim.fn.getcwd(0)] = command
    vim.g.COMPILE_COMMANDS_CUSTOM = vim.json.encode(saved_table)
  end

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
