---@class Config
---@field opt string Your config option
local config = {}

local colors = {
  jet              = "#242424",
  charcoal         = "#2B2B2B",
  silver_chalice   = "#C9D0D3",
  ash_gray         = "#9DA1A4",
  ochre            = "#CC7832",
  dark_khaki       = "#D3B987",
  purple           = "#9876AA",
  forest_green     = "#6A8759",
  steel_blue       = "#6897BB",
  maya_blue        = "#73B8FF",
  bright_red       = "#F43753",
  electric_lime    = "#A9FF68",
  electric_cyan    = "#00F1F5",
  gray_asparagus   = "#303030",
  outer_space      = "#3C3F41",
  onyx             = "#444444",
  lemon_glacier    = "#C9D05C",
  pale_silver      = "#B6B6B6",
  raisin_black     = "#1E1E1E",
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
  if vim.g.colors_name ~= nil then
    vim.cmd("highiight clear")
  end

  -- neovim version should be higher than 0.8.3
  if vim.fn.has("nvim-0.8.3") == 0 then
    vim.cmd(
      "echohi WarningMsg | echo 'Your neovim version is lower than 0.8.3, some features may not work correctly!' | echohi None"
    )
  end

  vim.g.colors_name = "darcula-dark"
  vim.o.termguicolors = true
  vim.highlight.priorities.semantic_tokens = 120
  M.configure_highlights()
end

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

M.configure_highlights = function()
  -- Highiight groups

  -- lsp semantics token
  hi("Normal",              { fg = colors.silver_chalice, bg = colors.jet })
  hi("NormalNC",            { fg = colors.silver_chalice, bg = colors.jet })
  hi("CursorLine",          { bg = colors.gray_asparagus })
  hi("CursorLineNr",        { fg = colors.maya_blue, bold = true })
  hi("LineNr",              { fg = colors.ash_gray })
  hi("Comment",             { fg = colors.ash_gray, italic = true })
  hi("Visual",              { bg = colors.outer_space })
  hi("Search",              { bg = colors.outer_space, fg = colors.maya_blue })
  hi("IncSearch",           { bg = colors.maya_blue, fg = colors.jet })
  hi("MatchParen",          { fg = colors.ochre, bold = true })
  hi("Pmenu",               { bg = colors.charcoal, fg = colors.silver_chalice })
  hi("PmenuSel",            { bg = colors.outer_space, fg = colors.maya_blue })
  hi("VertSplit",           { fg = colors.onyx })
  hi("StatusLine",          { bg = colors.charcoal, fg = colors.silver_chalice })
  hi("StatusLineNC",        { bg = colors.charcoal, fg = colors.ash_gray })
  hi("WinSeparator",        { fg = colors.onyx })
  hi("SignColumn",          { bg = colors.jet })
  hi("Cursor",              { reverse = true })
  hi("Folded",              { fg = colors.ash_gray, bg = colors.charcoal })
  hi("FoldColumn",          { fg = colors.ash_gray, bg = colors.jet })
  hi("ErrorMsg",            { fg = colors.bright_red, bold = true })
  hi("Title",               { fg = colors.maya_blue, bold = true })

  -- Syntax
  hi("Identifier",          { fg = colors.maya_blue })
  hi("Function",            { fg = colors.maya_blue })
  hi("Keyword",             { fg = colors.ochre, bold = true })
  hi("Statement",           { fg = colors.ochre })
  hi("Type",                { fg = colors.purple })
  hi("Constant",            { fg = colors.dark_khaki })
  hi("String",              { fg = colors.forest_green })
  hi("Character",           { fg = colors.forest_green })
  hi("Number",              { fg = colors.steel_blue })
  hi("Boolean",             { fg = colors.steel_blue })
  hi("Operator",            { fg = colors.silver_chalice })
  hi("PreProc",             { fg = colors.ochre })
  hi("Special",             { fg = colors.maya_blue })
  hi("Todo",                { fg = colors.dark_khaki, bold = true })
  hi("Error",               { fg = colors.bright_red })

  -- Diagnostics
  hi("DiagnosticError",     { fg = colors.bright_red })
  hi("DiagnosticWarn",      { fg = colors.dark_khaki })
  hi("DiagnosticInfo",      { fg = colors.electric_cyan })
  hi("DiagnosticHint",      { fg = colors.electric_lime })
  hi("DiagnosticUnderlineError", { undercurl = true, sp = colors.bright_red })
  hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = colors.dark_khaki })
  hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = colors.electric_cyan })
  hi("DiagnosticUnderlineHint",  { undercurl = true, sp = colors.electric_lime })

  -- Diff / Git
  hi("DiffAdd",             { bg = "#2e3d2e" })
  hi("DiffChange",          { bg = "#3a3d2e" })
  hi("DiffDelete",          { bg = "#402e2e" })
  hi("DiffText",            { bg = "#505f30" })
  hi("GitSignsAdd",         { fg = colors.forest_green })
  hi("GitSignsChange",      { fg = colors.lemon_glacier })
  hi("GitSignsDelete",      { fg = colors.bright_red })

  -- Tree-sitter
  hi("@comment",            { fg = colors.ash_gray, italic = true })
  hi("@keyword",            { fg = colors.ochre })
  hi("@function",           { fg = colors.maya_blue })
  hi("@type",               { fg = colors.purple })
  hi("@string",             { fg = colors.forest_green })
  hi("@number",             { fg = colors.steel_blue })
  hi("@boolean",            { fg = colors.steel_blue })
  hi("@constant",           { fg = colors.dark_khaki })
  hi("@variable",           { fg = colors.silver_chalice })
  hi("@field",              { fg = colors.dark_khaki })
  hi("@property",           { fg = colors.dark_khaki })
  hi("@parameter",          { fg = colors.dark_khaki })
  hi("@punctuation",        { fg = colors.silver_chalice })
  hi("@operator",           { fg = colors.silver_chalice })

  -- LSP
  hi("@lsp.type.class",     { link = "@type" })
  hi("@lsp.type.interface", { link = "@type" })
  hi("@lsp.type.parameter", { link = "@parameter" })
  hi("@lsp.type.property",  { link = "@property" })
  hi("@lsp.type.variable",  { link = "@variable" })

  -- Plugins

  -- nvim.flash
  hi(0, "FlashMatch", { fg = colors.ochre })
  hi(0, "FlashCurrent", { fg = colors.cadet_grey })
  hi(0, "Flashiabel", { fg = colors.ghost_white, bg = gray_asparagus })

  -- Terminal colors
  local g = vim.g

  g.terminal_color_0 = colors.gray_asparagus
  g.terminal_color_1 = colors.bright_red
  g.terminal_color_2 = colors.lemon_glacier
  g.terminal_color_3 = colors.battleship_gray
  g.terminal_color_4 = colors.powder_blue
  g.terminal_color_5 = colors.dark_khaki
  g.terminal_color_6 = colors.maya_blue
  g.terminal_color_7 = colors.light_gray
  g.terminal_color_8 = colors.gray_asparagus
  g.terminal_color_9 = colors.bright_red
  g.terminal_color_10 = colors.lemon_glacier
  g.terminal_color_11 = colors.battleship_gray
  g.terminal_color_12 = colors.powder_blue
  g.terminal_color_13 = colors.dark_khaki
  g.terminal_color_14 = colors.maya_blue
  g.terminal_color_15 = colors.white
end

return M