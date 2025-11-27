local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- Telescope
  G.TelescopeBorder = { fg = C.ui_border, bg = C.ui_bg }
  G.TelescopeNormal = { fg = C.fg, bg = C.ui_bg }
  G.TelescopeSelection = { bg = C.selection }
  G.TelescopeSelectionCaret = { fg = C.function_name }
  G.TelescopeMultiSelection = { fg = C.constant }
  G.TelescopeMatching = { fg = C.function_name, bold = true }

  G.TelescopePromptNormal = { fg = C.fg, bg = C.ui_bg }
  G.TelescopePromptBorder = { fg = C.ui_border, bg = C.ui_bg }
  G.TelescopePromptTitle = { fg = C.function_name, bg = C.ui_bg, bold = true }
  G.TelescopePromptPrefix = { fg = C.keyword }

  G.TelescopeResultsNormal = { fg = C.fg, bg = C.ui_bg }
  G.TelescopeResultsBorder = { fg = C.ui_border, bg = C.ui_bg }
  G.TelescopeResultsTitle = { fg = C.function_name, bg = C.ui_bg, bold = true }

  G.TelescopePreviewNormal = { fg = C.fg, bg = C.bg }
  G.TelescopePreviewBorder = { fg = C.ui_border, bg = C.bg }
  G.TelescopePreviewTitle = { fg = C.function_name, bg = C.bg, bold = true }
  G.TelescopePreviewLine = { bg = C.line_highlight }

  return G
end

return M
