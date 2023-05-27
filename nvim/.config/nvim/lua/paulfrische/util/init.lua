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

M.map = function (mode, lhs, rhs, opt)
  vim.keymap.set(mode, lhs, rhs, opt)
end

M.bufmap = function(mode, lhs, rhs)
  local opts = { buffer = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
