local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- Neo-tree
  G.NeoTreeNormal = { fg = C.fg, bg = C.bg }
  G.NeoTreeNormalNC = { fg = C.fg, bg = C.bg }
  G.NeoTreeDirectoryIcon = { fg = C.keyword }
  G.NeoTreeDirectoryName = { fg = C.keyword }
  G.NeoTreeFileName = { fg = C.fg }
  G.NeoTreeFileIcon = { fg = C.fg }
  G.NeoTreeGitAdded = { fg = C.git_add }
  G.NeoTreeGitModified = { fg = C.git_change }
  G.NeoTreeGitDeleted = { fg = C.git_delete }
  G.NeoTreeGitUntracked = { fg = C.git_add }
  G.NeoTreeGitIgnored = { fg = C.comment, italic = true }
  G.NeoTreeRootName = { fg = C.function_name, bold = true }

  return G
end

return M
