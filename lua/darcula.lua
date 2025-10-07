local M = {}

-- ============================================================
-- 🎨 COLOR PALETTE
-- ============================================================
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

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function set_highlights()
  -- Core UI
  hl("Normal",              { fg = colors.silver_chalice, bg = colors.jet })
  hl("NormalNC",            { fg = colors.silver_chalice, bg = colors.jet })
  hl("CursorLine",          { bg = colors.gray_asparagus })
  hl("CursorLineNr",        { fg = colors.maya_blue, bold = true })
  hl("LineNr",              { fg = colors.ash_gray })
  hl("Comment",             { fg = colors.ash_gray, italic = true })
  hl("Visual",              { bg = colors.outer_space })
  hl("Search",              { bg = colors.outer_space, fg = colors.maya_blue })
  hl("IncSearch",           { bg = colors.maya_blue, fg = colors.jet })
  hl("MatchParen",          { fg = colors.ochre, bold = true })
  hl("Pmenu",               { bg = colors.charcoal, fg = colors.silver_chalice })
  hl("PmenuSel",            { bg = colors.outer_space, fg = colors.maya_blue })
  hl("VertSplit",           { fg = colors.onyx })
  hl("StatusLine",          { bg = colors.charcoal, fg = colors.silver_chalice })
  hl("StatusLineNC",        { bg = colors.charcoal, fg = colors.ash_gray })
  hl("WinSeparator",        { fg = colors.onyx })
  hl("SignColumn",          { bg = colors.jet })
  hl("Cursor",              { reverse = true })
  hl("Folded",              { fg = colors.ash_gray, bg = colors.charcoal })
  hl("FoldColumn",          { fg = colors.ash_gray, bg = colors.jet })
  hl("ErrorMsg",            { fg = colors.bright_red, bold = true })
  hl("Title",               { fg = colors.maya_blue, bold = true })

  -- Syntax
  hl("Identifier",          { fg = colors.maya_blue })
  hl("Function",            { fg = colors.maya_blue })
  hl("Keyword",             { fg = colors.ochre, bold = true })
  hl("Statement",           { fg = colors.ochre })
  hl("Type",                { fg = colors.purple })
  hl("Constant",            { fg = colors.dark_khaki })
  hl("String",              { fg = colors.forest_green })
  hl("Character",           { fg = colors.forest_green })
  hl("Number",              { fg = colors.steel_blue })
  hl("Boolean",             { fg = colors.steel_blue })
  hl("Operator",            { fg = colors.silver_chalice })
  hl("PreProc",             { fg = colors.ochre })
  hl("Special",             { fg = colors.maya_blue })
  hl("Todo",                { fg = colors.dark_khaki, bold = true })
  hl("Error",               { fg = colors.bright_red })

  -- Diagnostics
  hl("DiagnosticError",     { fg = colors.bright_red })
  hl("DiagnosticWarn",      { fg = colors.dark_khaki })
  hl("DiagnosticInfo",      { fg = colors.electric_cyan })
  hl("DiagnosticHint",      { fg = colors.electric_lime })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.bright_red })
  hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = colors.dark_khaki })
  hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = colors.electric_cyan })
  hl("DiagnosticUnderlineHint",  { undercurl = true, sp = colors.electric_lime })

  -- Diff / Git
  hl("DiffAdd",             { bg = "#2e3d2e" })
  hl("DiffChange",          { bg = "#3a3d2e" })
  hl("DiffDelete",          { bg = "#402e2e" })
  hl("DiffText",            { bg = "#505f30" })
  hl("GitSignsAdd",         { fg = colors.forest_green })
  hl("GitSignsChange",      { fg = colors.lemon_glacier })
  hl("GitSignsDelete",      { fg = colors.bright_red })

  -- Tree-sitter
  hl("@comment",            { fg = colors.ash_gray, italic = true })
  hl("@keyword",            { fg = colors.ochre })
  hl("@function",           { fg = colors.maya_blue })
  hl("@type",               { fg = colors.purple })
  hl("@string",             { fg = colors.forest_green })
  hl("@number",             { fg = colors.steel_blue })
  hl("@boolean",            { fg = colors.steel_blue })
  hl("@constant",           { fg = colors.dark_khaki })
  hl("@variable",           { fg = colors.silver_chalice })
  hl("@field",              { fg = colors.dark_khaki })
  hl("@property",           { fg = colors.dark_khaki })
  hl("@parameter",          { fg = colors.dark_khaki })
  hl("@punctuation",        { fg = colors.silver_chalice })
  hl("@operator",           { fg = colors.silver_chalice })

  -- LSP
  hl("@lsp.type.class",     { link = "@type" })
  hl("@lsp.type.interface", { link = "@type" })
  hl("@lsp.type.parameter", { link = "@parameter" })
  hl("@lsp.type.property",  { link = "@property" })
  hl("@lsp.type.variable",  { link = "@variable" })

  -- Plugins
  -- nvim.flash
  hi(0, "FlashMatch", { fg = colors.ochre })
  hi(0, "FlashCurrent", { fg = colors.cadet_grey })
  hi(0, "FlashLabel", { fg = colors.ghost_white, bg = gray_asparagus })

  -- Terminal colors
  vim.g.terminal_color_0  = colors.jet
  vim.g.terminal_color_1  = colors.bright_red
  vim.g.terminal_color_2  = colors.forest_green
  vim.g.terminal_color_3  = colors.dark_khaki
  vim.g.terminal_color_4  = colors.steel_blue
  vim.g.terminal_color_5  = colors.purple
  vim.g.terminal_color_6  = colors.electric_cyan
  vim.g.terminal_color_7  = colors.silver_chalice
  vim.g.terminal_color_8  = colors.charcoal
  vim.g.terminal_color_9  = colors.bright_red
  vim.g.terminal_color_10 = colors.forest_green
  vim.g.terminal_color_11 = colors.dark_khaki
  vim.g.terminal_color_12 = colors.steel_blue
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_14 = colors.electric_cyan
  vim.g.terminal_color_15 = colors.silver_chalice
end

-- ============================================================
-- ⚙️ ENTRY POINT
-- ============================================================
function M.setup()
  vim.o.termguicolors = true
  vim.g.colors_name = "darcula_refined"
  vim.cmd("hi clear")
  set_highlights()
end

return M
