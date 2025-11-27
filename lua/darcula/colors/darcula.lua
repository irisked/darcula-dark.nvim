---@diagnostic disable: undefined-global

-- Base Darcula color palette
-- Accurate IntelliJ IDEA Darcula colors

local darcula = {
  none = "NONE",

  -- Background and foreground
  bg = "#202020",
  fg = "#B9C7D6",

  -- UI colors
  ui_bg = "#202020",
  ui_border = "#FFD67D",
  selection = "#323232",
  line_highlight = "#323232",
  cursor = "#CBCBCB",
  gutter_fg = "#707376",
  gutter_bg = "#313335",

  -- Syntax colors (IntelliJ Darcula)
  keyword = "#DC8842", -- Orange: keywords, control flow
  string = "#7A9769", -- Green: strings
  number = "#78A7CB", -- Blue: numbers
  comment = "#909090", -- Gray: comments
  doc_comment = "#72A765", -- Doc green: documentation
  function_name = "#ffd67d", -- Yellow: function names
  class_name = "#a4c7f0", -- Default foreground for classes
  constant = "#A886BA", -- Purple: constants
  parameter = "#B9C7D6", -- Default foreground
  type = "#9898D6", -- Built-in type purple
  decorator = "#CBC539", -- Decorator yellow-green
  tag = "#F8CF7A", -- Tag yellow
  attribute = "#CACACA", -- Attribute gray

  -- Diff colors
  diff_add = "#294436",
  diff_change = "#385570",
  diff_delete = "#484A4A",
  diff_text = "#385570",

  -- Diagnostic colors
  error = "#CC4F4C",
  warning = "#B9C7D6",
  info = "#7A9769",
  hint = "#78A7CB",

  -- Git colors
  git_add = "#72A765",
  git_change = "#EDB165",
  git_delete = "#CC4F4C",

  -- Special colors
  todo = "#B8D033",
  link = "#388BEE",
  match = "#3A4D2A",
  search = "#32593D",
  directory = "#a4c7f0",

  -- UI element colors
  pmenu_bg = "#3C3F41",
  pmenu_sel = "#113A5C",

  -- Additional colors
  white = "#FFFFFF",
  black = "#000000",
  bright_red = "#FF7B78",
  bright_green = "#B8FF70",
  bright_yellow = "#FFE710",
}

return darcula
