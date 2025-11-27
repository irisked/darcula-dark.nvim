local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- GitSigns
  G.GitSignsAdd = { fg = C.git_add, bg = C.gutter_bg }
  G.GitSignsChange = { fg = C.git_change, bg = C.gutter_bg }
  G.GitSignsDelete = { fg = C.git_delete, bg = C.gutter_bg }
  G.GitSignsCurrentLineBlame = { fg = C.comment, italic = true }

  G.GitSignsStagedAdd = { fg = C.git_add, bg = C.gutter_bg }
  G.GitSignsStagedChange = { fg = C.git_change, bg = C.gutter_bg }
  G.GitSignsStagedDelete = { fg = C.git_delete, bg = C.gutter_bg }

  G.GitSignsAddPreview = { link = "GitSignsAdd" }
  G.GitSignsDeletePreview = { link = "GitSignsDelete" }

  -- GitGutter (alternative)
  G.GitGutterAdd = { link = "GitSignsAdd" }
  G.GitGutterChange = { link = "GitSignsChange" }
  G.GitGutterDelete = { link = "GitSignsDelete" }

  return G
end

return M
