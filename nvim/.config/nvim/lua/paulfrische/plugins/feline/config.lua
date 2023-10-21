local M = {}

local components = require('paulfrische.plugins.feline.components')
M.components = {}

M.components.active = {
  { components.vi_mode,    components.file_info },
  { components.git_branch, components.lsp() },
  {
    components.git(),
    components.vi_mode,
  },
}

M.components.inactive = {
  { components.file_info },
  { components.git_branch },
  {
    components.git(),
  },
}

M.properties = {}

return M
