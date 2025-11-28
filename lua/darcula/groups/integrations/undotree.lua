local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- UndoTree - Undo history tree visualization
  G.UndotreeNode = { fg = C.gutter_fg }
  G.UndotreeNodeCurrent = { fg = C.git_add, bold = true }
  G.UndotreeBranch = { fg = C.comment }

  G.UndotreeFirstNode = { fg = C.function_name, bold = true }
  G.UndotreeCurrent = { fg = C.git_add, bold = true }
  G.UndotreeNext = { fg = C.git_change }
  G.UndotreeHead = { fg = C.function_name, bold = true }

  G.UndotreeSavedSmall = { fg = C.git_add }
  G.UndotreeSavedBig = { fg = C.git_add, bold = true }

  G.UndotreeSeq = { fg = C.number }
  G.UndotreeTimeStamp = { fg = C.comment }

  G.UndotreeHelp = { fg = C.comment }
  G.UndotreeHelpKey = { fg = C.keyword, bold = true }
  G.UndotreeHelpTitle = { fg = C.function_name, bold = true }

  return G
end

return M
