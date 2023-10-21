local M = {}

--- prints and returns a table
---@param v table
---@return table
M.print_table = function(v)
  print(vim.inspect(v))
  return v
end

--- return length of table
---@param tbl table
---@return integer
M.length = function(tbl)
  local len = 0
  for _, _ in pairs(tbl) do
    len = len + 1
  end
  return len
end

--- return number of words in current buffer
---@return integer
M.words_in_buffer = function()
  local words = 0
  local text = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for _, line in ipairs(text) do
    for _ in line:gmatch('%S+') do
      words = words + 1
    end
  end
  return words
end

-- TODO: make this work
---@return string
M.selected = function()
  local start = vim.api.nvim_buf_get_mark(0, '<')
  local ending = vim.api.nvim_buf_get_mark(0, '>')

  if vim.fn.visualmode() == 'V' then
    local last =
        vim.api.nvim_buf_get_lines(0, ending[1], ending[1] + 1, true)[1]
    ending[2] = #last - 1
  end

  M.print_table(start)
  M.print_table(ending)

  return vim.fn.join(
    vim.api.nvim_buf_get_text(0, start[1], start[2], ending[1], ending[2], {}),
    '\n'
  )
end

M.map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

M.bufmap = function(mode, lhs, rhs, desc)
  local opts = { buffer = true, desc = desc, silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
