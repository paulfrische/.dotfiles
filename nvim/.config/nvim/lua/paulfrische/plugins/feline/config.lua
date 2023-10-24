local M = {}

require('paulfrische.plugins.feline.themes')

local components = require('paulfrische.plugins.feline.components')
M.components = {}

M.components.active = {
  {
    components.vi_mode,
    components.icon,
    components.file_info,
    components.lsp_name,
  },
  {},
  {
    components.git_branch,
    components.git(),
    components.lsp(),
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
