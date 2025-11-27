local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- Indent Blankline (v3)
  G.IblIndent = { fg = C.line_highlight, nocombine = true }
  G.IblScope = { fg = C.gutter_fg, nocombine = true }
  G.IblWhitespace = { fg = C.line_highlight, nocombine = true }

  -- Legacy names (v2)
  G.IndentBlanklineChar = { link = "IblIndent" }
  G.IndentBlanklineContextChar = { link = "IblScope" }
  G.IndentBlanklineSpaceChar = { link = "IblWhitespace" }

  return G
end

return M
