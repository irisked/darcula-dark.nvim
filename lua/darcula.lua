---@class Config
---@field opt string Your config option
local config = {}

-- Accurate IntelliJ IDEA Darcula color palette
local colors = {
  -- Background and foreground
  bg = "#242424",
  fg = "#B9C7D6",

  -- UI colors
  ui_bg = "#3C3F41",
  ui_border = "#323232",
  selection = "#214283",
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
  function_name = "#FFD67D", -- Yellow: function names
  class_name = "#B9C7D6", -- Default foreground for classes
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
  git_change = "#78A7CB",
  git_delete = "#CC4F4C",

  -- Special colors
  todo = "#B8D033",
  link = "#388BEE",
  match = "#3A4D2A",
  search = "#32593D",

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

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
  if vim.g.colors_name ~= nil then
    vim.cmd("highlight clear")
  end

  -- neovim version should be higher than 0.8.3
  if vim.fn.has("nvim-0.8.3") == 0 then
    vim.cmd(
      "echohl WarningMsg | echo 'Your neovim version is lower than 0.8.3, some features may not work correctly!' | echohl None"
    )
  end

  vim.g.colors_name = "darcula-dark"
  vim.o.termguicolors = true
  vim.highlight.priorities.semantic_tokens = 120
  M.configure_highlights()
end

M.configure_highlights = function()
  local hi = vim.api.nvim_set_hl

  -- ============================================================================
  -- BASE EDITOR COLORS
  -- ============================================================================
  hi(0, "Normal", { fg = colors.fg, bg = colors.bg })
  hi(0, "NormalFloat", { fg = colors.fg, bg = colors.ui_bg })
  hi(0, "NormalNC", { fg = colors.fg, bg = colors.bg })
  hi(0, "FloatBorder", { fg = colors.ui_border, bg = colors.ui_bg })
  hi(0, "FloatTitle", { fg = colors.fg, bg = colors.ui_bg, bold = true })

  -- Cursor
  hi(0, "Cursor", { fg = colors.bg, bg = colors.cursor })
  hi(0, "CursorLine", { bg = colors.line_highlight })
  hi(0, "CursorLineNr", { fg = colors.fg, bg = colors.line_highlight, bold = true })
  hi(0, "CursorColumn", { bg = colors.line_highlight })
  hi(0, "lCursor", { link = "Cursor" })
  hi(0, "iCursor", { link = "Cursor" })
  hi(0, "TermCursor", { link = "Cursor" })
  hi(0, "TermCursorNC", { link = "Cursor" })

  -- Line numbers
  hi(0, "LineNr", { fg = colors.gutter_fg, bg = colors.gutter_bg })
  hi(0, "SignColumn", { fg = colors.gutter_fg, bg = colors.gutter_bg })
  hi(0, "FoldColumn", { fg = colors.gutter_fg, bg = colors.gutter_bg })
  hi(0, "Folded", { fg = colors.gutter_fg, bg = colors.line_highlight })

  -- Visual selection
  hi(0, "Visual", { bg = colors.selection })
  hi(0, "VisualNOS", { bg = colors.selection })

  -- Search
  hi(0, "Search", { bg = colors.search })
  hi(0, "IncSearch", { bg = colors.match, fg = colors.white })
  hi(0, "CurSearch", { link = "IncSearch" })
  hi(0, "Substitute", { link = "IncSearch" })

  -- Messages and prompts
  hi(0, "ErrorMsg", { fg = colors.error, bold = true })
  hi(0, "WarningMsg", { fg = colors.warning })
  hi(0, "ModeMsg", { fg = colors.fg, bold = true })
  hi(0, "MoreMsg", { fg = colors.string, bold = true })
  hi(0, "Question", { fg = colors.string, bold = true })
  hi(0, "Title", { fg = colors.function_name, bold = true })

  -- UI elements
  hi(0, "StatusLine", { fg = colors.fg, bg = colors.ui_bg })
  hi(0, "StatusLineNC", { fg = colors.gutter_fg, bg = colors.ui_bg })
  hi(0, "TabLine", { fg = colors.gutter_fg, bg = colors.ui_bg })
  hi(0, "TabLineFill", { bg = colors.ui_bg })
  hi(0, "TabLineSel", { fg = colors.fg, bg = colors.bg, bold = true })
  hi(0, "VertSplit", { fg = colors.ui_border })
  hi(0, "WinBar", { fg = colors.fg })
  hi(0, "WinBarNC", { fg = colors.gutter_fg })
  hi(0, "WinSeparator", { fg = colors.ui_border })

  -- Completion menu
  hi(0, "Pmenu", { fg = colors.fg, bg = colors.pmenu_bg })
  hi(0, "PmenuSel", { fg = colors.white, bg = colors.pmenu_sel })
  hi(0, "PmenuSbar", { bg = colors.ui_bg })
  hi(0, "PmenuThumb", { bg = colors.gutter_fg })
  hi(0, "WildMenu", { link = "PmenuSel" })

  -- Misc
  hi(0, "Directory", { fg = colors.keyword })
  hi(0, "NonText", { fg = colors.gutter_fg })
  hi(0, "SpecialKey", { fg = colors.gutter_fg })
  hi(0, "Whitespace", { fg = colors.gutter_fg })
  hi(0, "ColorColumn", { bg = colors.line_highlight })
  hi(0, "QuickFixLine", { bg = colors.selection })
  hi(0, "MatchParen", { fg = colors.bright_yellow, bold = true })

  -- ============================================================================
  -- SYNTAX HIGHLIGHTING (Base)
  -- ============================================================================
  hi(0, "Comment", { fg = colors.comment, italic = true })
  hi(0, "Constant", { fg = colors.constant })
  hi(0, "String", { fg = colors.string })
  hi(0, "Character", { fg = colors.string })
  hi(0, "Number", { fg = colors.number })
  hi(0, "Boolean", { fg = colors.keyword })
  hi(0, "Float", { fg = colors.number })

  hi(0, "Identifier", { fg = colors.fg })
  hi(0, "Function", { fg = colors.function_name })

  hi(0, "Statement", { fg = colors.keyword })
  hi(0, "Conditional", { fg = colors.keyword })
  hi(0, "Repeat", { fg = colors.keyword })
  hi(0, "Label", { fg = colors.keyword })
  hi(0, "Operator", { fg = colors.fg })
  hi(0, "Keyword", { fg = colors.keyword })
  hi(0, "Exception", { fg = colors.keyword })

  hi(0, "PreProc", { fg = colors.keyword })
  hi(0, "Include", { fg = colors.keyword })
  hi(0, "Define", { fg = colors.keyword })
  hi(0, "Macro", { fg = colors.keyword })
  hi(0, "PreCondit", { fg = colors.keyword })

  hi(0, "Type", { fg = colors.type })
  hi(0, "StorageClass", { fg = colors.keyword })
  hi(0, "Structure", { fg = colors.keyword })
  hi(0, "Typedef", { fg = colors.keyword })

  hi(0, "Special", { fg = colors.tag })
  hi(0, "SpecialChar", { fg = colors.tag })
  hi(0, "Tag", { fg = colors.tag })
  hi(0, "Delimiter", { fg = colors.fg })
  hi(0, "SpecialComment", { fg = colors.doc_comment, italic = true })
  hi(0, "Debug", { fg = colors.error })

  hi(0, "Underlined", { fg = colors.link, underline = true })
  hi(0, "Ignore", { fg = colors.gutter_fg })
  hi(0, "Error", { fg = colors.error, bold = true })
  hi(0, "Todo", { fg = colors.todo, bg = colors.line_highlight, bold = true })

  -- ============================================================================
  -- TREESITTER
  -- ============================================================================
  hi(0, "@variable", { fg = colors.fg })
  hi(0, "@variable.builtin", { fg = colors.keyword, bold = true })
  hi(0, "@variable.parameter", { fg = colors.parameter })
  hi(0, "@variable.member", { fg = colors.constant })

  hi(0, "@constant", { fg = colors.constant })
  hi(0, "@constant.builtin", { fg = colors.keyword, bold = true })
  hi(0, "@constant.macro", { fg = colors.constant })

  hi(0, "@module", { fg = colors.fg })
  hi(0, "@label", { fg = colors.constant })

  hi(0, "@string", { fg = colors.string })
  hi(0, "@string.escape", { fg = colors.number })
  hi(0, "@string.regexp", { fg = colors.number })
  hi(0, "@string.special", { fg = colors.tag })

  hi(0, "@character", { fg = colors.string })
  hi(0, "@character.special", { fg = colors.tag })

  hi(0, "@number", { fg = colors.number })
  hi(0, "@number.float", { fg = colors.number })
  hi(0, "@boolean", { fg = colors.keyword })

  hi(0, "@function", { fg = colors.function_name })
  hi(0, "@function.builtin", { fg = colors.function_name, bold = true })
  hi(0, "@function.call", { fg = colors.function_name })
  hi(0, "@function.macro", { fg = colors.keyword })
  hi(0, "@function.method", { fg = colors.function_name })
  hi(0, "@function.method.call", { fg = colors.function_name })

  hi(0, "@constructor", { fg = colors.function_name })
  hi(0, "@operator", { fg = colors.fg })

  hi(0, "@keyword", { fg = colors.keyword })
  hi(0, "@keyword.function", { fg = colors.keyword })
  hi(0, "@keyword.operator", { fg = colors.keyword })
  hi(0, "@keyword.return", { fg = colors.keyword })
  hi(0, "@keyword.import", { fg = colors.keyword })
  hi(0, "@keyword.conditional", { fg = colors.keyword })
  hi(0, "@keyword.repeat", { fg = colors.keyword })
  hi(0, "@keyword.exception", { fg = colors.keyword })

  hi(0, "@type", { fg = colors.class_name })
  hi(0, "@type.builtin", { fg = colors.keyword, bold = true })
  hi(0, "@type.definition", { fg = colors.class_name })
  hi(0, "@type.qualifier", { fg = colors.keyword })

  hi(0, "@attribute", { fg = colors.decorator })
  hi(0, "@property", { fg = colors.constant })
  hi(0, "@field", { fg = colors.constant })

  hi(0, "@comment", { link = "Comment" })
  hi(0, "@comment.documentation", { fg = colors.doc_comment, italic = true })
  hi(0, "@comment.todo", { fg = colors.todo, bold = true })
  hi(0, "@comment.warning", { fg = colors.warning, bold = true })
  hi(0, "@comment.error", { fg = colors.error, bold = true })
  hi(0, "@comment.note", { fg = colors.info, bold = true })

  hi(0, "@punctuation.delimiter", { fg = colors.fg })
  hi(0, "@punctuation.bracket", { fg = colors.fg })
  hi(0, "@punctuation.special", { fg = colors.fg })

  hi(0, "@tag", { fg = colors.tag })
  hi(0, "@tag.attribute", { fg = colors.attribute })
  hi(0, "@tag.delimiter", { fg = colors.fg })

  hi(0, "@markup.strong", { bold = true })
  hi(0, "@markup.italic", { italic = true })
  hi(0, "@markup.strikethrough", { strikethrough = true })
  hi(0, "@markup.underline", { underline = true })
  hi(0, "@markup.heading", { fg = colors.function_name, bold = true })
  hi(0, "@markup.link", { fg = colors.link, underline = true })
  hi(0, "@markup.link.url", { fg = colors.link, underline = true })
  hi(0, "@markup.raw", { fg = colors.string })
  hi(0, "@markup.math", { fg = colors.number })
  hi(0, "@markup.list", { fg = colors.keyword })
  hi(0, "@markup.list.checked", { fg = colors.git_add })
  hi(0, "@markup.list.unchecked", { fg = colors.gutter_fg })

  -- Diff
  hi(0, "@diff.plus", { fg = colors.git_add })
  hi(0, "@diff.minus", { fg = colors.git_delete })
  hi(0, "@diff.delta", { fg = colors.git_change })

  -- ============================================================================
  -- LSP SEMANTIC TOKENS
  -- ============================================================================
  hi(0, "@lsp.type.namespace", { fg = colors.fg })
  hi(0, "@lsp.type.type", { fg = colors.class_name })
  hi(0, "@lsp.type.class", { fg = colors.class_name })
  hi(0, "@lsp.type.enum", { fg = colors.class_name })
  hi(0, "@lsp.type.interface", { fg = colors.class_name })
  hi(0, "@lsp.type.struct", { fg = colors.class_name })
  hi(0, "@lsp.type.parameter", { fg = colors.parameter })
  hi(0, "@lsp.type.variable", { fg = colors.fg })
  hi(0, "@lsp.type.variable.go", { fg = colors.parameter })
  hi(0, "@lsp.type.namespace.go", { fg = colors.fg })
  hi(0, "@lsp.type.property", { fg = colors.constant })
  hi(0, "@lsp.type.enumMember", { fg = colors.constant })
  hi(0, "@lsp.type.function", { fg = colors.function_name })
  hi(0, "@lsp.type.method", { fg = colors.function_name })
  hi(0, "@lsp.type.macro", { fg = colors.keyword })
  hi(0, "@lsp.type.decorator", { fg = colors.decorator })
  hi(0, "@lsp.type.comment", { link = "Comment" })

  -- LSP modifiers
  hi(0, "@lsp.mod.readonly", { italic = true })
  hi(0, "@lsp.mod.deprecated", { strikethrough = true, fg = colors.gutter_fg })
  hi(0, "@lsp.typemod.function.defaultLibrary", { fg = colors.function_name, bold = true })
  hi(0, "@lsp.typemod.variable.defaultLibrary", { fg = colors.keyword, bold = true })
  hi(0, "@lsp.typemod.variable.readonly", { fg = colors.constant })

  -- ============================================================================
  -- GO LANGUAGE SPECIFIC
  -- ============================================================================
  -- Go keywords and types
  hi(0, "@keyword.go", { fg = colors.keyword })
  hi(0, "@keyword.function.go", { fg = colors.keyword })
  hi(0, "@keyword.operator.go", { fg = colors.keyword })
  hi(0, "@keyword.import.go", { fg = colors.keyword })
  hi(0, "@type.builtin.go", { fg = colors.keyword, bold = true })

  -- Go functions and methods
  hi(0, "@function.go", { fg = colors.function_name })
  hi(0, "@function.method.go", { fg = colors.function_name })
  hi(0, "@function.call.go", { fg = colors.function_name })
  hi(0, "@function.method.call.go", { fg = colors.function_name })

  -- Go variables and constants
  hi(0, "@variable.go", { fg = colors.fg })
  hi(0, "@variable.builtin.go", { fg = colors.keyword, bold = true })
  hi(0, "@constant.go", { fg = colors.constant })
  hi(0, "@constant.builtin.go", { fg = colors.keyword, bold = true })

  -- Go types
  hi(0, "@type.go", { fg = colors.class_name })
  hi(0, "@type.definition.go", { fg = colors.class_name })

  -- Go fields and properties
  hi(0, "@property.go", { fg = colors.constant })
  hi(0, "@field.go", { fg = colors.constant })
  hi(0, "@variable.member.go", { fg = colors.constant })

  -- Go strings and comments
  hi(0, "@string.go", { fg = colors.string })
  hi(0, "@comment.go", { fg = colors.comment, italic = true })
  hi(0, "@comment.documentation.go", { fg = colors.doc_comment, italic = true })

  -- Go numbers
  hi(0, "@number.go", { fg = colors.number })

  -- LSP semantic tokens for Go
  hi(0, "@lsp.type.namespace.go", { fg = colors.white, bold = true })
  hi(0, "@lsp.type.type.go", { fg = colors.class_name })
  hi(0, "@lsp.type.struct.go", { fg = colors.class_name })
  hi(0, "@lsp.type.interface.go", { fg = colors.class_name })
  hi(0, "@lsp.type.function.go", { fg = colors.function_name })
  hi(0, "@lsp.type.method.go", { fg = colors.function_name })
  hi(0, "@lsp.type.variable.go", { fg = colors.fg })
  hi(0, "@lsp.type.parameter.go", { fg = colors.parameter })
  hi(0, "@lsp.type.property.go", { fg = colors.constant })
  hi(0, "@lsp.typemod.variable.readonly.go", { fg = colors.constant })
  hi(0, "@lsp.typemod.variable.defaultLibrary.go", { fg = colors.keyword, bold = true })
  hi(0, "@lsp.mod.defaultLibrary.go", { fg = colors.keyword, bold = true })

  -- Legacy syntax support for Go
  hi(0, "goImportString", { link = "@string.go" })
  hi(0, "goBlock", { link = "@variable.go" })

  -- ============================================================================
  -- DIAGNOSTICS
  -- ============================================================================
  hi(0, "DiagnosticError", { fg = colors.error })
  hi(0, "DiagnosticWarn", { fg = colors.warning })
  hi(0, "DiagnosticInfo", { fg = colors.info })
  hi(0, "DiagnosticHint", { fg = colors.hint })
  hi(0, "DiagnosticOk", { fg = colors.git_add })

  hi(0, "DiagnosticUnderlineError", { sp = colors.error, undercurl = true })
  hi(0, "DiagnosticUnderlineWarn", { sp = colors.warning, undercurl = true })
  hi(0, "DiagnosticUnderlineInfo", { sp = colors.info, undercurl = true })
  hi(0, "DiagnosticUnderlineHint", { sp = colors.hint, undercurl = true })
  hi(0, "DiagnosticUnderlineOk", { sp = colors.git_add, undercurl = true })

  hi(0, "DiagnosticVirtualTextError", { fg = colors.error, bg = colors.bg })
  hi(0, "DiagnosticVirtualTextWarn", { fg = colors.warning, bg = colors.bg })
  hi(0, "DiagnosticVirtualTextInfo", { fg = colors.info, bg = colors.bg })
  hi(0, "DiagnosticVirtualTextHint", { fg = colors.hint, bg = colors.bg })

  hi(0, "DiagnosticSignError", { fg = colors.error, bg = colors.gutter_bg })
  hi(0, "DiagnosticSignWarn", { fg = colors.warning, bg = colors.gutter_bg })
  hi(0, "DiagnosticSignInfo", { fg = colors.info, bg = colors.gutter_bg })
  hi(0, "DiagnosticSignHint", { fg = colors.hint, bg = colors.gutter_bg })

  -- ============================================================================
  -- DIFF
  -- ============================================================================
  hi(0, "DiffAdd", { bg = colors.diff_add })
  hi(0, "DiffChange", { bg = colors.diff_change })
  hi(0, "DiffDelete", { bg = colors.diff_delete })
  hi(0, "DiffText", { bg = colors.diff_text })

  hi(0, "DiffAdded", { fg = colors.git_add })
  hi(0, "DiffRemoved", { fg = colors.git_delete })
  hi(0, "DiffChanged", { fg = colors.git_change })
  hi(0, "DiffFile", { fg = colors.function_name })
  hi(0, "DiffLine", { fg = colors.number })

  -- ============================================================================
  -- GIT SIGNS
  -- ============================================================================
  hi(0, "GitSignsAdd", { fg = colors.git_add, bg = colors.gutter_bg })
  hi(0, "GitSignsChange", { fg = colors.git_change, bg = colors.gutter_bg })
  hi(0, "GitSignsDelete", { fg = colors.git_delete, bg = colors.gutter_bg })
  hi(0, "GitSignsCurrentLineBlame", { fg = colors.comment, italic = true })

  hi(0, "GitSignsStagedAdd", { fg = colors.git_add, bg = colors.gutter_bg })
  hi(0, "GitSignsStagedChange", { fg = colors.git_change, bg = colors.gutter_bg })
  hi(0, "GitSignsStagedDelete", { fg = colors.git_delete, bg = colors.gutter_bg })

  hi(0, "GitGutterAdd", { link = "GitSignsAdd" })
  hi(0, "GitGutterChange", { link = "GitSignsChange" })
  hi(0, "GitGutterDelete", { link = "GitSignsDelete" })

  -- ============================================================================
  -- SNACKS.NVIM - PICKER
  -- ============================================================================
  -- Picker window
  hi(0, "SnacksPickerNormalFloat", { link = "NormalFloat" })
  hi(0, "SnacksPickerBorder", { fg = colors.ui_border, bg = colors.ui_bg })
  hi(0, "SnacksPickerTitle", { fg = colors.function_name, bg = colors.ui_bg, bold = true })
  hi(0, "SnacksPickerFooter", { fg = colors.gutter_fg, bg = colors.ui_bg })
  hi(0, "SnacksPickerCursorLine", { bg = colors.selection })

  -- Picker list
  hi(0, "SnacksPickerList", { link = "NormalFloat" })
  hi(0, "SnacksPickerListCursorLine", { bg = colors.selection })

  -- Picker preview
  hi(0, "SnacksPickerPreview", { link = "NormalFloat" })
  hi(0, "SnacksPickerPreviewCursorLine", { bg = colors.selection })

  -- Picker input/prompt
  hi(0, "SnacksPickerPrompt", { fg = colors.fg, bg = colors.ui_bg })
  hi(0, "SnacksPickerInput", { fg = colors.fg, bg = colors.ui_bg })
  hi(0, "SnacksPickerInputSearch", { fg = colors.function_name, bg = colors.ui_bg })

  -- Picker highlighting
  hi(0, "SnacksPickerMatch", { fg = colors.function_name, bold = true })
  hi(0, "SnacksPickerSearch", { bg = colors.search })
  hi(0, "SnacksPickerSelected", { fg = colors.bright_green, bold = true })
  hi(0, "SnacksPickerUnselected", { fg = colors.gutter_fg })

  -- Files and directories
  hi(0, "SnacksPickerFile", { fg = colors.fg })
  hi(0, "SnacksPickerDir", { fg = colors.keyword })
  hi(0, "SnacksPickerDirectory", { fg = colors.keyword })
  hi(0, "SnacksPickerPathHidden", { fg = colors.gutter_fg })
  hi(0, "SnacksPickerPathIgnored", { fg = colors.comment, italic = true })
  hi(0, "SnacksPickerLink", { fg = colors.link, underline = true })
  hi(0, "SnacksPickerLinkBroken", { fg = colors.error, underline = true })

  -- Git status in picker
  hi(0, "SnacksPickerGitStatus", { fg = colors.gutter_fg })
  hi(0, "SnacksPickerGitStatusAdded", { fg = colors.git_add })
  hi(0, "SnacksPickerGitStatusModified", { fg = colors.git_change })
  hi(0, "SnacksPickerGitStatusDeleted", { fg = colors.git_delete })
  hi(0, "SnacksPickerGitStatusRenamed", { fg = colors.function_name })
  hi(0, "SnacksPickerGitStatusCopied", { fg = colors.function_name })
  hi(0, "SnacksPickerGitStatusUntracked", { fg = colors.git_add })
  hi(0, "SnacksPickerGitStatusStaged", { fg = colors.git_add, bold = true })
  hi(0, "SnacksPickerGitStatusUnmerged", { fg = colors.error })

  -- Git information
  hi(0, "SnacksPickerGitBranch", { fg = colors.constant })
  hi(0, "SnacksPickerGitBranchCurrent", { fg = colors.git_add, bold = true })
  hi(0, "SnacksPickerGitDetached", { fg = colors.error })
  hi(0, "SnacksPickerGitCommit", { fg = colors.function_name })
  hi(0, "SnacksPickerGitDate", { fg = colors.comment })
  hi(0, "SnacksPickerGitAuthor", { fg = colors.fg })
  hi(0, "SnacksPickerGitMsg", { fg = colors.string })
  hi(0, "SnacksPickerGitScope", { fg = colors.constant })
  hi(0, "SnacksPickerGitType", { fg = colors.keyword })
  hi(0, "SnacksPickerGitBreaking", { fg = colors.error, bold = true })
  hi(0, "SnacksPickerGitIssue", { fg = colors.link })

  -- Icons and markers
  hi(0, "SnacksPickerIcon", { fg = colors.function_name })
  hi(0, "SnacksPickerIconCategory", { fg = colors.constant })
  hi(0, "SnacksPickerIconName", { fg = colors.fg })
  hi(0, "SnacksPickerIconSource", { fg = colors.comment })

  -- UI elements
  hi(0, "SnacksPickerSpinner", { fg = colors.function_name })
  hi(0, "SnacksPickerRule", { fg = colors.ui_border })
  hi(0, "SnacksPickerIdx", { fg = colors.number })
  hi(0, "SnacksPickerRow", { fg = colors.comment })
  hi(0, "SnacksPickerCol", { fg = colors.comment })
  hi(0, "SnacksPickerTotals", { fg = colors.comment })
  hi(0, "SnacksPickerToggle", { fg = colors.function_name })
  hi(0, "SnacksPickerSpecial", { fg = colors.tag })
  hi(0, "SnacksPickerLabel", { fg = colors.function_name })
  hi(0, "SnacksPickerDelim", { fg = colors.gutter_fg })
  hi(0, "SnacksPickerDimmed", { fg = colors.gutter_fg })

  -- Syntax in picker
  hi(0, "SnacksPickerCode", { fg = colors.string })
  hi(0, "SnacksPickerComment", { fg = colors.comment, italic = true })
  hi(0, "SnacksPickerBold", { bold = true })
  hi(0, "SnacksPickerItalic", { italic = true })

  -- LSP and diagnostics in picker
  hi(0, "SnacksPickerLspAttached", { fg = colors.git_add })
  hi(0, "SnacksPickerLspAttachedBuf", { fg = colors.git_add })
  hi(0, "SnacksPickerLspEnabled", { fg = colors.git_add })
  hi(0, "SnacksPickerLspDisabled", { fg = colors.error })
  hi(0, "SnacksPickerLspUnavailable", { fg = colors.comment })

  hi(0, "SnacksPickerDiagnosticCode", { fg = colors.comment })
  hi(0, "SnacksPickerDiagnosticSource", { fg = colors.comment })

  -- Additional picker elements
  hi(0, "SnacksPickerBufNr", { fg = colors.number })
  hi(0, "SnacksPickerBufType", { fg = colors.keyword })
  hi(0, "SnacksPickerBufFlags", { fg = colors.constant })
  hi(0, "SnacksPickerFileType", { fg = colors.keyword })
  hi(0, "SnacksPickerTime", { fg = colors.comment })
  hi(0, "SnacksPickerTree", { fg = colors.gutter_fg })
  hi(0, "SnacksPickerBox", { fg = colors.ui_border })
  hi(0, "SnacksPickerPickWin", { fg = colors.function_name })
  hi(0, "SnacksPickerDesc", { fg = colors.comment })
  hi(0, "SnacksPickerCmd", { fg = colors.function_name })
  hi(0, "SnacksPickerRegister", { fg = colors.constant })

  -- Keymap picker
  hi(0, "SnacksPickerKeymapMode", { fg = colors.constant })
  hi(0, "SnacksPickerKeymapLhs", { fg = colors.function_name })
  hi(0, "SnacksPickerKeymapRhs", { fg = colors.string })
  hi(0, "SnacksPickerKeymapNowait", { fg = colors.keyword })

  -- Man pages
  hi(0, "SnacksPickerManPage", { fg = colors.function_name })
  hi(0, "SnacksPickerManSection", { fg = colors.constant })
  hi(0, "SnacksPickerManDesc", { fg = colors.comment })

  -- Autocommands
  hi(0, "SnacksPickerAuEvent", { fg = colors.constant })
  hi(0, "SnacksPickerAuGroup", { fg = colors.function_name })
  hi(0, "SnacksPickerAuPattern", { fg = colors.string })

  -- Undo tree
  hi(0, "SnacksPickerUndoCurrent", { fg = colors.function_name, bold = true })
  hi(0, "SnacksPickerUndoSaved", { fg = colors.git_add })
  hi(0, "SnacksPickerUndoAdded", { fg = colors.git_add })
  hi(0, "SnacksPickerUndoRemoved", { fg = colors.git_delete })

  -- Notifications
  hi(0, "SnacksPickerNotificationMessage", { fg = colors.fg })

  -- ============================================================================
  -- SNACKS.NVIM - DASHBOARD
  -- ============================================================================
  hi(0, "SnacksDashboardNormal", { link = "Normal" })
  hi(0, "SnacksDashboardIcon", { fg = colors.function_name })
  hi(0, "SnacksDashboardDesc", { fg = colors.fg })
  hi(0, "SnacksDashboardKey", { fg = colors.keyword, bold = true })
  hi(0, "SnacksDashboardTitle", { fg = colors.function_name, bold = true })
  hi(0, "SnacksDashboardHeader", { fg = colors.constant })
  hi(0, "SnacksDashboardFooter", { fg = colors.comment })
  hi(0, "SnacksDashboardTerminal", { link = "Normal" })

  -- ============================================================================
  -- SNACKS.NVIM - OTHER COMPONENTS
  -- ============================================================================
  -- Input
  hi(0, "SnacksInputNormal", { link = "NormalFloat" })
  hi(0, "SnacksInputBorder", { fg = colors.ui_border, bg = colors.ui_bg })
  hi(0, "SnacksInputTitle", { fg = colors.function_name, bg = colors.ui_bg, bold = true })

  -- Notifications
  hi(0, "SnacksNotifierHistory", { link = "NormalFloat" })
  hi(0, "SnacksNotifierBorder", { fg = colors.ui_border, bg = colors.ui_bg })
  hi(0, "SnacksNotifierTitle", { fg = colors.function_name, bg = colors.ui_bg, bold = true })
  hi(0, "SnacksNotifierIcon", { fg = colors.function_name })

  -- Footer
  hi(0, "SnacksFooter", { fg = colors.comment, bg = colors.ui_bg })
  hi(0, "SnacksFooterKey", { fg = colors.keyword, bold = true })
  hi(0, "SnacksFooterDesc", { fg = colors.fg })

  -- Backdrop
  hi(0, "SnacksBackdrop", { bg = colors.black })

  -- Diff
  hi(0, "SnacksDiffAdd", { fg = colors.git_add })
  hi(0, "SnacksDiffConflict", { fg = colors.error })
  hi(0, "SnacksDiffContext", { fg = colors.comment })
  hi(0, "SnacksDiffDelete", { fg = colors.git_delete })
  hi(0, "SnacksDiffHeader", { fg = colors.function_name, bold = true })
  hi(0, "SnacksDiffLabel", { fg = colors.constant })

  -- Debug
  hi(0, "SnacksDebug", { fg = colors.error })
  hi(0, "SnacksDebugPrint", { fg = colors.function_name })
  hi(0, "SnacksDebugIndent", { fg = colors.gutter_fg })

  -- Dim
  hi(0, "SnacksDim", { fg = colors.gutter_fg })

  -- ============================================================================
  -- COMPLETION (nvim-cmp)
  -- ============================================================================
  hi(0, "CmpDocumentation", { fg = colors.fg, bg = colors.ui_bg })
  hi(0, "CmpDocumentationBorder", { fg = colors.ui_border, bg = colors.ui_bg })

  hi(0, "CmpItemAbbr", { fg = colors.fg })
  hi(0, "CmpItemAbbrDeprecated", { fg = colors.gutter_fg, strikethrough = true })
  hi(0, "CmpItemAbbrMatch", { fg = colors.function_name, bold = true })
  hi(0, "CmpItemAbbrMatchFuzzy", { fg = colors.function_name, bold = true })

  hi(0, "CmpItemKindText", { fg = colors.fg })
  hi(0, "CmpItemKindMethod", { fg = colors.function_name })
  hi(0, "CmpItemKindFunction", { fg = colors.function_name })
  hi(0, "CmpItemKindConstructor", { fg = colors.function_name })
  hi(0, "CmpItemKindField", { fg = colors.constant })
  hi(0, "CmpItemKindVariable", { fg = colors.fg })
  hi(0, "CmpItemKindClass", { fg = colors.class_name })
  hi(0, "CmpItemKindInterface", { fg = colors.class_name })
  hi(0, "CmpItemKindModule", { fg = colors.fg })
  hi(0, "CmpItemKindProperty", { fg = colors.constant })
  hi(0, "CmpItemKindUnit", { fg = colors.constant })
  hi(0, "CmpItemKindValue", { fg = colors.constant })
  hi(0, "CmpItemKindEnum", { fg = colors.class_name })
  hi(0, "CmpItemKindKeyword", { fg = colors.keyword })
  hi(0, "CmpItemKindSnippet", { fg = colors.string })
  hi(0, "CmpItemKindColor", { fg = colors.tag })
  hi(0, "CmpItemKindFile", { fg = colors.fg })
  hi(0, "CmpItemKindReference", { fg = colors.link })
  hi(0, "CmpItemKindFolder", { fg = colors.keyword })
  hi(0, "CmpItemKindEnumMember", { fg = colors.constant })
  hi(0, "CmpItemKindConstant", { fg = colors.constant })
  hi(0, "CmpItemKindStruct", { fg = colors.class_name })
  hi(0, "CmpItemKindEvent", { fg = colors.keyword })
  hi(0, "CmpItemKindOperator", { fg = colors.fg })
  hi(0, "CmpItemKindTypeParameter", { fg = colors.type })

  hi(0, "CmpItemMenu", { fg = colors.comment })

  -- ============================================================================
  -- TELESCOPE
  -- ============================================================================
  hi(0, "TelescopeBorder", { fg = colors.ui_border, bg = colors.ui_bg })
  hi(0, "TelescopeNormal", { fg = colors.fg, bg = colors.ui_bg })
  hi(0, "TelescopeSelection", { bg = colors.selection })
  hi(0, "TelescopeSelectionCaret", { fg = colors.function_name })
  hi(0, "TelescopeMultiSelection", { fg = colors.constant })
  hi(0, "TelescopeMatching", { fg = colors.function_name, bold = true })

  hi(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.ui_bg })
  hi(0, "TelescopePromptBorder", { fg = colors.ui_border, bg = colors.ui_bg })
  hi(0, "TelescopePromptTitle", { fg = colors.function_name, bg = colors.ui_bg, bold = true })
  hi(0, "TelescopePromptPrefix", { fg = colors.keyword })

  hi(0, "TelescopeResultsNormal", { fg = colors.fg, bg = colors.ui_bg })
  hi(0, "TelescopeResultsBorder", { fg = colors.ui_border, bg = colors.ui_bg })
  hi(0, "TelescopeResultsTitle", { fg = colors.function_name, bg = colors.ui_bg, bold = true })

  hi(0, "TelescopePreviewNormal", { fg = colors.fg, bg = colors.bg })
  hi(0, "TelescopePreviewBorder", { fg = colors.ui_border, bg = colors.bg })
  hi(0, "TelescopePreviewTitle", { fg = colors.function_name, bg = colors.bg, bold = true })
  hi(0, "TelescopePreviewLine", { bg = colors.line_highlight })

  -- ============================================================================
  -- TREE FILE EXPLORER (neo-tree, nvim-tree)
  -- ============================================================================
  hi(0, "NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
  hi(0, "NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg })
  hi(0, "NeoTreeDirectoryIcon", { fg = colors.keyword })
  hi(0, "NeoTreeDirectoryName", { fg = colors.keyword })
  hi(0, "NeoTreeFileName", { fg = colors.fg })
  hi(0, "NeoTreeFileIcon", { fg = colors.fg })
  hi(0, "NeoTreeGitAdded", { fg = colors.git_add })
  hi(0, "NeoTreeGitModified", { fg = colors.git_change })
  hi(0, "NeoTreeGitDeleted", { fg = colors.git_delete })
  hi(0, "NeoTreeGitUntracked", { fg = colors.git_add })
  hi(0, "NeoTreeGitIgnored", { fg = colors.comment, italic = true })
  hi(0, "NeoTreeRootName", { fg = colors.function_name, bold = true })

  hi(0, "NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
  hi(0, "NvimTreeFolderIcon", { fg = colors.keyword })
  hi(0, "NvimTreeFolderName", { fg = colors.keyword })
  hi(0, "NvimTreeOpenedFolderName", { fg = colors.keyword, bold = true })
  hi(0, "NvimTreeRootFolder", { fg = colors.function_name, bold = true })
  hi(0, "NvimTreeGitDirty", { fg = colors.git_change })
  hi(0, "NvimTreeGitNew", { fg = colors.git_add })
  hi(0, "NvimTreeGitDeleted", { fg = colors.git_delete })
  hi(0, "NvimTreeSpecialFile", { fg = colors.tag })

  -- ============================================================================
  -- INDENT BLANKLINE
  -- ============================================================================
  hi(0, "IblIndent", { fg = colors.line_highlight, nocombine = true })
  hi(0, "IblScope", { fg = colors.gutter_fg, nocombine = true })
  hi(0, "IblWhitespace", { fg = colors.line_highlight, nocombine = true })

  -- Legacy names
  hi(0, "IndentBlanklineChar", { link = "IblIndent" })
  hi(0, "IndentBlanklineContextChar", { link = "IblScope" })
  hi(0, "IndentBlanklineSpaceChar", { link = "IblWhitespace" })

  -- ============================================================================
  -- SPELL CHECKING
  -- ============================================================================
  hi(0, "SpellBad", { sp = colors.error, undercurl = true })
  hi(0, "SpellCap", { sp = colors.hint, undercurl = true })
  hi(0, "SpellLocal", { sp = colors.info, undercurl = true })
  hi(0, "SpellRare", { sp = colors.warning, undercurl = true })

  -- ============================================================================
  -- TERMINAL COLORS
  -- ============================================================================
  local g = vim.g

  g.terminal_color_0 = "#1E1E1E"
  g.terminal_color_1 = colors.error
  g.terminal_color_2 = colors.string
  g.terminal_color_3 = colors.function_name
  g.terminal_color_4 = colors.number
  g.terminal_color_5 = colors.constant
  g.terminal_color_6 = colors.info
  g.terminal_color_7 = colors.fg
  g.terminal_color_8 = colors.gutter_fg
  g.terminal_color_9 = colors.bright_red
  g.terminal_color_10 = colors.bright_green
  g.terminal_color_11 = colors.bright_yellow
  g.terminal_color_12 = colors.number
  g.terminal_color_13 = colors.constant
  g.terminal_color_14 = colors.info
  g.terminal_color_15 = colors.white
end

return M
