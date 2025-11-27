local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- nvim-tree
  G.NvimTreeNormal = { fg = C.fg, bg = C.bg }
  G.NvimTreeFolderIcon = { fg = C.keyword }
  G.NvimTreeFolderName = { fg = C.keyword }
  G.NvimTreeOpenedFolderName = { fg = C.keyword, bold = true }
  G.NvimTreeRootFolder = { fg = C.function_name, bold = true }
  G.NvimTreeGitDirty = { fg = C.git_change }
  G.NvimTreeGitNew = { fg = C.git_add }
  G.NvimTreeGitDeleted = { fg = C.git_delete }
  G.NvimTreeSpecialFile = { fg = C.tag }

  return G
end

return M
