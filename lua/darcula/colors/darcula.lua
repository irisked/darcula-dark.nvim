---@diagnostic disable: undefined-global

-- Base Darcula color palette
-- Accurate IntelliJ IDEA Darcula colors

local darcula = {
  none = "NONE",

  -- Background and foreground
  bg = "#202020", -- Very dark gray, almost black
  fg = "#B9C7D6", -- Light grayish blue

  -- UI colors
  ui_bg = "#202020", -- Very dark gray
  ui_border = "#FFD67D", -- Light yellow/gold
  selection = "#323232", -- Dark gray
  line_highlight = "#323232", -- Dark gray
  cursor = "#CBCBCB", -- Light gray
  gutter_fg = "#707376", -- Medium gray
  gutter_bg = "#313335", -- Dark gray

  -- Syntax colors (IntelliJ Darcula)
  keyword = "#DC8842", -- Orange: keywords, control flow
  string = "#7A9769", -- Muted sage green: strings
  number = "#78A7CB", -- Light blue: numbers
  comment = "#909090", -- Medium gray: comments
  doc_comment = "#72A765", -- Green: documentation
  function_name = "#ffca4d", -- Light yellow/gold: function names
  class_name = "#a4c7f0", -- Light blue: classes
  constant = "#A886BA", -- Purple/lavender: constants
  parameter = "#B9C7D6", -- Light grayish blue: parameters
  type = "#9898D6", -- Light purple: built-in types
  decorator = "#CBC539", -- Yellow-green/lime: decorators
  tag = "#F8CF7A", -- Light yellow/gold: tags
  attribute = "#CACACA", -- Light gray: attributes

  -- Diff colors
  diff_add = "#294436", -- Dark green
  diff_change = "#385570", -- Dark blue
  diff_delete = "#484A4A", -- Dark gray
  diff_text = "#385570", -- Dark blue

  -- Diagnostic colors
  error = "#CC4F4C", -- Red
  warning = "#EDB165", -- Orange/gold
  info = "#7A9769", -- Muted green
  hint = "#78A7CB", -- Light blue

  -- Git colors
  git_add = "#72A765", -- Green
  git_change = "#EDB165", -- Orange/gold
  git_delete = "#CC4F4C", -- Red

  -- Special colors
  todo = "#B8D033", -- Bright lime green
  link = "#388BEE", -- Bright blue
  match = "#3A4D2A", -- Dark olive green
  search = "#32593D", -- Dark green
  directory = "#a4c7f0", -- Light blue

  -- UI element colors
  pmenu_bg = "#3C3F41", -- Dark gray
  pmenu_sel = "#113A5C", -- Dark blue

  -- Additional colors
  white = "#FFFFFF", -- White
  black = "#000000", -- Black
  bright_red = "#FF7B78", -- Bright red/salmon
  bright_green = "#B8FF70", -- Bright lime green
  bright_yellow = "#FFE710", -- Bright yellow
}

return darcula
