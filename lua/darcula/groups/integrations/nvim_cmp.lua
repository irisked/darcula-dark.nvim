local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- nvim-cmp
  G.CmpDocumentation = { fg = C.fg, bg = C.ui_bg }
  G.CmpDocumentationBorder = { fg = C.ui_border, bg = C.ui_bg }

  G.CmpItemAbbr = { fg = C.fg }
  G.CmpItemAbbrDeprecated = { fg = C.gutter_fg, strikethrough = true }
  G.CmpItemAbbrMatch = { fg = C.function_name, bold = true }
  G.CmpItemAbbrMatchFuzzy = { fg = C.function_name, bold = true }

  G.CmpItemKindText = { fg = C.fg }
  G.CmpItemKindMethod = { fg = C.function_name }
  G.CmpItemKindFunction = { fg = C.function_name }
  G.CmpItemKindConstructor = { fg = C.function_name }
  G.CmpItemKindField = { fg = C.constant }
  G.CmpItemKindVariable = { fg = C.white }
  G.CmpItemKindClass = { fg = C.class_name }
  G.CmpItemKindInterface = { fg = C.class_name }
  G.CmpItemKindModule = { fg = C.fg }
  G.CmpItemKindProperty = { fg = C.constant }
  G.CmpItemKindUnit = { fg = C.constant }
  G.CmpItemKindValue = { fg = C.constant }
  G.CmpItemKindEnum = { fg = C.class_name }
  G.CmpItemKindKeyword = { fg = C.keyword }
  G.CmpItemKindSnippet = { fg = C.string }
  G.CmpItemKindColor = { fg = C.tag }
  G.CmpItemKindFile = { fg = C.fg }
  G.CmpItemKindReference = { fg = C.link }
  G.CmpItemKindFolder = { fg = C.keyword }
  G.CmpItemKindEnumMember = { fg = C.constant }
  G.CmpItemKindConstant = { fg = C.constant }
  G.CmpItemKindStruct = { fg = C.class_name }
  G.CmpItemKindEvent = { fg = C.keyword }
  G.CmpItemKindOperator = { fg = C.fg }
  G.CmpItemKindTypeParameter = { fg = C.type }

  G.CmpItemMenu = { fg = C.comment }

  return G
end

return M
