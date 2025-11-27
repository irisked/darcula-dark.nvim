---@diagnostic disable: undefined-global

local darcula_palette = require("darcula.colors.darcula")
local config = require("darcula.config")

local M = {}

---Build the color palette with semantic color mappings
---@return table
M.build_palette = function()
  local palette = vim.deepcopy(darcula_palette)
  local options = config.options

  -- Allow user to modify base palette before processing
  if options.on_palette then
    options.on_palette(palette)
  end

  -- Add semantic color mappings for easier highlight group definitions
  local semantic = {
    -- Background variations
    bg = palette.bg,
    bg_dark = palette.ui_bg,
    bg_sidebar = palette.gutter_bg,
    bg_statusline = palette.ui_bg,
    bg_float = palette.ui_bg,
    bg_visual = palette.selection,
    bg_search = palette.search,
    bg_highlight = palette.line_highlight,
    bg_menu = palette.pmenu_bg,
    bg_menu_sel = palette.pmenu_sel,

    -- Foreground variations
    fg = palette.fg,
    fg_dark = palette.gutter_fg,
    fg_gutter = palette.gutter_fg,
    fg_sidebar = palette.fg,

    -- Border colors
    border = palette.ui_border,
    border_highlight = palette.ui_border,

    -- Diagnostics
    error = palette.error,
    warning = palette.warning,
    info = palette.info,
    hint = palette.hint,

    -- Git signs
    git_add = palette.git_add,
    git_change = palette.git_change,
    git_delete = palette.git_delete,

    -- Diff colors
    diff_add = palette.diff_add,
    diff_change = palette.diff_change,
    diff_delete = palette.diff_delete,
    diff_text = palette.diff_text,

    -- Special
    none = palette.none,
  }

  -- Merge semantic colors into palette
  palette = vim.tbl_extend("force", palette, semantic)

  -- Allow user to modify extended palette
  if options.after_palette then
    options.after_palette(palette)
  end

  return palette
end

return M
