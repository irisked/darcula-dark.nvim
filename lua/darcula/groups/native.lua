local M = {}

-- Base Neovim highlight groups following Nordic.nvim structure
-- These groups form the foundation for all syntax highlighting

function M.get_groups()
  local C = require("darcula.colors").build_palette()
  local O = require("darcula.config").options

  ---@class NativeHighlights
  local G = {}

  -- ============================================================================
  -- SYNTAX
  -- ============================================================================
  G.Constant = { fg = C.constant } -- any constant
  G.Number = { fg = C.number } -- number constant: 234, 0xff
  G.Boolean = { fg = C.keyword } -- boolean constant: TRUE, false
  G.Float = { link = "Number" } -- floating point constant: 2.3e10
  G.None = { fg = C.none, bg = C.none }
  G.String = { fg = C.string } -- string constant: "this is a string"
  G.Character = { fg = C.string } -- character constant: 'c', '\n'
  G.Variable = { fg = C.white }
  G.Namespace = { fg = C.fg }
  G.Field = { fg = C.constant }
  G.Title = { fg = C.function_name, bold = true }
  G.Builtin = { fg = C.keyword, bold = true }
  G.Identifier = { fg = C.white } -- any variable name
  G.Function = { fg = C.function_name } -- function name (also: methods for classes)
  G.Keyword = { fg = C.keyword, bold = O.bold_keywords } -- any other keyword
  G.Statement = { link = "Keyword" } -- any statement
  G.Conditional = { link = "Keyword" } -- if, then, else, endif, switch, etc.
  G.Repeat = { link = "Keyword" } -- for, do, while, etc.
  G.Label = { link = "Keyword" } -- case, default, etc.
  G.Operator = { fg = C.fg } -- "sizeof", "+", "*", etc.
  G.Macro = { fg = C.keyword } -- same as Define
  G.Exception = { link = "Keyword" } -- try, catch, throw
  G.PreProc = { link = "Keyword" } -- generic preprocessor
  G.Include = { link = "Keyword" } -- preprocessor #include
  G.Define = { link = "Keyword" } -- preprocessor #define
  G.PreCondit = { link = "Keyword" } -- preprocessor #if, #else, #endif, etc.
  G.Comment = { fg = C.comment, italic = O.italic_comments }
  G.Type = { fg = C.type } -- int, long, char, etc.
  G.StorageClass = { link = "Keyword" } -- static, register, volatile, etc.
  G.Structure = { link = "Keyword" } -- struct, union, enum, etc.
  G.Typedef = { link = "Keyword" } -- typedef
  G.Special = { fg = C.tag } -- any special symbol
  G.Delimiter = { fg = C.fg } -- character that needs attention
  G.Underlined = { fg = C.link, underline = true } -- text that stands out, HTML links
  G.Bold = { bold = true }
  G.Italic = { italic = true }
  G.Ignore = { fg = C.gutter_fg } -- left blank, hidden
  G.Error = { fg = C.error, bold = true } -- any erroneous construct
  G.Todo = { fg = C.todo, bg = C.line_highlight, bold = true } -- TODO FIXME XXX
  G.Note = { fg = C.info, bold = true }

  -- Markdown
  G.htmlH1 = { fg = C.function_name, bold = true }
  G.htmlH2 = { fg = C.keyword }
  G.Link = { fg = C.link, underline = true }
  G.CodeBlock = { fg = C.string }
  G.mkdHeading = { link = "htmlH1" }
  G.mkdCode = { link = "CodeBlock" }
  G.mkdCodeDelimiter = { link = "CodeBlock" }
  G.mkdCodeStart = { fg = C.tag, bold = true }
  G.mkdCodeEnd = { fg = C.tag, bold = true }
  G.mkdLink = { link = "Link" }
  G.markdownHeadingDelimiter = { link = "mkdHeading" }
  G.markdownCode = { link = "CodeBlock" }
  G.markdownCodeBlock = { link = "CodeBlock" }
  G.markdownH1 = { link = "htmlH1" }
  G.markdownH2 = { link = "htmlH2" }
  G.markdownLinkText = { link = "Link" }

  -- ============================================================================
  -- LANGUAGE SERVER PROTOCOL & DIAGNOSTICS
  -- ============================================================================
  G.LspReferenceText = { bg = C.line_highlight } -- highlighting "text" references
  G.LspReferenceRead = { bg = C.line_highlight } -- highlighting "read" references
  G.LspReferenceWrite = { bg = C.line_highlight } -- highlighting "write" references
  G.DiagnosticError = { fg = C.error }
  G.DiagnosticWarn = { fg = C.warning }
  G.DiagnosticInfo = { fg = C.info }
  G.DiagnosticHint = { fg = C.hint }
  G.DiagnosticVirtualTextError = { fg = C.error, bg = C.bg }
  G.DiagnosticVirtualTextWarn = { fg = C.warning, bg = C.bg }
  G.DiagnosticVirtualTextWarning = { fg = C.warning, bg = C.bg }
  G.DiagnosticVirtualTextInfo = { fg = C.info, bg = C.bg }
  G.DiagnosticVirtualTextHint = { fg = C.hint, bg = C.bg }
  G.DiagnosticUnderlineError = { undercurl = true, sp = C.error }
  G.DiagnosticUnderlineWarn = { undercurl = true, sp = C.warning }
  G.DiagnosticUnderlineInfo = { undercurl = true, sp = C.info }
  G.DiagnosticUnderlineHint = { undercurl = true, sp = C.hint }
  G.DiagnosticSignError = { fg = C.error, bg = C.gutter_bg }
  G.DiagnosticSignWarn = { fg = C.warning, bg = C.gutter_bg }
  G.DiagnosticSignInfo = { fg = C.info, bg = C.gutter_bg }
  G.DiagnosticSignHint = { fg = C.hint, bg = C.gutter_bg }
  G.LspSignatureActiveParameter = { underline = true, bold = true }
  G.LspCodeLens = { fg = C.comment }
  G.LspInfoBorder = { link = "FloatBorder" }

  -- ============================================================================
  -- TREE/FILE EXPLORER
  -- ============================================================================
  G.TreeNormal = { fg = C.fg, bg = C.bg }
  G.TreeNormalNC = { fg = C.fg, bg = C.bg }
  G.TreeRootName = { fg = C.function_name, bold = true }
  G.TreeFileIcon = { fg = C.fg }
  G.TreeFileNameOpened = { fg = C.fg }
  G.TreeSpecialFile = { fg = C.tag }
  G.TreeGitConflict = { fg = C.error }
  G.TreeGitModified = { fg = C.git_change }
  G.TreeGitDirty = { fg = C.git_change }
  G.TreeGitAdded = { fg = C.git_add }
  G.TreeGitNew = { fg = C.git_add }
  G.TreeGitDeleted = { fg = C.git_delete }
  G.TreeGitStaged = { fg = C.git_add }
  G.TreeGitUntracked = { fg = C.git_add }
  G.TreeTitleBar = { link = "WinBar" }
  G.TreeFloatBorder = { link = "FloatBorder" }
  G.TreeCursorLine = { bg = C.selection }
  G.TreeCursor = { bg = C.none, fg = C.none }
  G.TreeFolderIcon = { fg = C.keyword }
  G.TreeIndentMarker = { fg = C.gutter_fg }
  G.TreeSymlink = { fg = C.link }
  G.TreeFolderName = { fg = C.keyword }
  G.TreeWinSeparator = { link = "WinSeparator" }

  -- ============================================================================
  -- UI ELEMENTS
  -- ============================================================================
  G.ColorColumn = { bg = C.line_highlight }
  G.Conceal = { fg = C.gutter_fg }
  G.Cursor = { fg = C.bg, bg = C.cursor }
  G.lCursor = { link = "Cursor" }
  G.iCursor = { link = "Cursor" }
  G.CursorIM = { link = "Cursor" }
  G.TermCursor = { link = "Cursor" }
  G.TermCursorNC = { link = "Cursor" }
  G.CursorColumn = { bg = C.line_highlight }
  G.CursorLine = { bg = C.line_highlight }
  G.CursorLineNr = { fg = C.fg, bg = C.line_highlight, bold = true }
  G.CursorLineSign = {}
  G.Directory = { fg = C.keyword }
  G.EndOfBuffer = { fg = C.gutter_fg }
  G.ErrorMsg = { fg = C.error, bold = true }
  G.VertSplit = { fg = C.ui_border }
  G.WinSeparator = { fg = C.ui_border }
  G.Folded = { fg = C.gutter_fg, bg = C.line_highlight }
  G.FoldColumn = { fg = C.gutter_fg, bg = C.gutter_bg }
  G.SignColumn = { fg = C.gutter_fg, bg = C.gutter_bg }
  G.SignColumnSB = { fg = C.gutter_fg, bg = C.gutter_bg }
  G.Substitute = { bg = C.match, fg = C.white }
  G.LineNr = { fg = C.gutter_fg, bg = C.gutter_bg }
  G.MatchParen = { fg = C.bright_yellow, bold = true }
  G.ModeMsg = { fg = C.fg, bold = true }
  G.MsgArea = { fg = C.fg }
  G.MoreMsg = { fg = C.string, bold = true }
  G.NonText = { fg = C.gutter_fg }
  G.Normal = { fg = C.fg, bg = O.transparent.bg and C.none or C.bg }
  G.NormalNC = { fg = C.fg, bg = O.transparent.bg and C.none or C.bg }
  G.NormalSB = { fg = C.fg, bg = C.bg }
  G.NormalFloat = { fg = C.fg, bg = O.transparent.float and C.none or C.ui_bg }
  G.FloatBorder = { fg = C.ui_border, bg = O.transparent.float and C.none or C.ui_bg }
  G.FloatTitle = { fg = C.fg, bg = O.transparent.float and C.none or C.ui_bg, bold = true }
  G.Pmenu = { fg = C.fg, bg = C.pmenu_bg }
  G.PmenuSel = { fg = C.white, bg = C.pmenu_sel }
  G.PmenuSbar = { bg = C.ui_bg }
  G.PmenuThumb = { bg = C.gutter_fg }
  G.Question = { fg = C.string, bold = true }
  G.QuickFixLine = { bg = C.selection }
  G.Search = { bg = C.search }
  G.IncSearch = { bg = C.match, fg = C.white }
  G.CurSearch = { link = "IncSearch" }
  G.SpecialKey = { fg = C.gutter_fg }
  G.SpellBad = { sp = C.error, undercurl = true }
  G.SpellCap = { sp = C.hint, undercurl = true }
  G.SpellLocal = { sp = C.info, undercurl = true }
  G.SpellRare = { sp = C.warning, undercurl = true }
  G.StatusLine = { fg = C.fg, bg = C.ui_bg }
  G.StatusLineNC = { fg = C.gutter_fg, bg = C.ui_bg }
  G.TabLine = { fg = C.gutter_fg, bg = C.ui_bg }
  G.TabLineFill = { bg = C.ui_bg }
  G.TabLineSel = { fg = C.fg, bg = C.bg, bold = true }
  G.Visual = { bg = C.selection }
  G.VisualNOS = { bg = C.selection }
  G.WarningMsg = { fg = C.warning }
  G.Whitespace = { fg = C.gutter_fg }
  G.WildMenu = { link = "PmenuSel" }
  G.WinBar = { fg = C.fg }
  G.WinBarNC = { fg = C.gutter_fg }

  -- ============================================================================
  -- DIFF
  -- ============================================================================
  G.DiffAdd = { bg = C.diff_add }
  G.DiffChange = { bg = C.diff_change }
  G.DiffDelete = { bg = C.diff_delete }
  G.DiffText = { bg = C.diff_text }
  G.DiffAdded = { fg = C.git_add }
  G.DiffRemoved = { fg = C.git_delete }
  G.DiffChanged = { fg = C.git_change }
  G.DiffFile = { fg = C.function_name }
  G.DiffLine = { fg = C.number }

  -- Debug
  G.debugPC = { bg = C.gutter_bg }
  G.debugBreakpoint = { fg = C.error }

  return G
end

return M
