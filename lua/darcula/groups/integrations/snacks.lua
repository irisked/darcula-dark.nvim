local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- ============================================================================
  -- SNACKS.NVIM - PICKER
  -- ============================================================================
  -- Picker window
  G.SnacksPickerNormalFloat = { link = "NormalFloat" }
  G.SnacksPickerBorder = { fg = C.ui_border, bg = C.ui_bg }
  G.SnacksPickerTitle = { fg = C.function_name, bg = C.ui_bg, bold = true }
  G.SnacksPickerFooter = { fg = C.gutter_fg, bg = C.ui_bg }
  G.SnacksPickerCursorLine = { bg = C.selection }

  -- Picker list
  G.SnacksPickerList = { link = "NormalFloat" }
  G.SnacksPickerListCursorLine = { bg = C.selection }

  -- Picker preview
  G.SnacksPickerPreview = { link = "NormalFloat" }
  G.SnacksPickerPreviewCursorLine = { bg = C.selection }

  -- Picker input/prompt
  G.SnacksPickerPrompt = { fg = C.fg, bg = C.ui_bg }
  G.SnacksPickerInput = { fg = C.fg, bg = C.ui_bg }
  G.SnacksPickerInputSearch = { fg = C.function_name, bg = C.ui_bg }

  -- Picker highlighting
  G.SnacksPickerMatch = { fg = C.function_name, bold = true }
  G.SnacksPickerSearch = { bg = C.search }
  G.SnacksPickerSelected = { fg = C.bright_green, bold = true }
  G.SnacksPickerUnselected = { fg = C.gutter_fg }

  -- Files and directories
  G.SnacksPickerFile = { fg = C.fg }
  G.SnacksPickerDir = { fg = C.directory }
  G.SnacksPickerDirectory = { fg = C.directory }
  G.SnacksPickerPathHidden = { fg = C.gutter_fg }
  G.SnacksPickerPathIgnored = { fg = C.comment, italic = true }
  G.SnacksPickerLink = { fg = C.link, underline = true }
  G.SnacksPickerLinkBroken = { fg = C.error, underline = true }

  -- Git status in picker
  G.SnacksPickerGitStatus = { fg = C.gutter_fg }
  G.SnacksPickerGitStatusAdded = { fg = C.git_add }
  G.SnacksPickerGitStatusModified = { fg = C.git_change }
  G.SnacksPickerGitStatusDeleted = { fg = C.git_delete }
  G.SnacksPickerGitStatusRenamed = { fg = C.function_name }
  G.SnacksPickerGitStatusCopied = { fg = C.function_name }
  G.SnacksPickerGitStatusUntracked = { fg = C.git_add }
  G.SnacksPickerGitStatusStaged = { fg = C.git_add, bold = true }
  G.SnacksPickerGitStatusUnmerged = { fg = C.error }

  -- Git information
  G.SnacksPickerGitBranch = { fg = C.constant }
  G.SnacksPickerGitBranchCurrent = { fg = C.git_add, bold = true }
  G.SnacksPickerGitDetached = { fg = C.error }
  G.SnacksPickerGitCommit = { fg = C.function_name }
  G.SnacksPickerGitDate = { fg = C.comment }
  G.SnacksPickerGitAuthor = { fg = C.fg }
  G.SnacksPickerGitMsg = { fg = C.string }
  G.SnacksPickerGitScope = { fg = C.constant }
  G.SnacksPickerGitType = { fg = C.keyword }
  G.SnacksPickerGitBreaking = { fg = C.error, bold = true }
  G.SnacksPickerGitIssue = { fg = C.link }

  -- Icons and markers
  G.SnacksPickerIcon = { fg = C.function_name }
  G.SnacksPickerIconCategory = { fg = C.constant }
  G.SnacksPickerIconName = { fg = C.fg }
  G.SnacksPickerIconSource = { fg = C.comment }

  -- UI elements
  G.SnacksPickerSpinner = { fg = C.function_name }
  G.SnacksPickerRule = { fg = C.ui_border }
  G.SnacksPickerIdx = { fg = C.number }
  G.SnacksPickerRow = { fg = C.comment }
  G.SnacksPickerCol = { fg = C.comment }
  G.SnacksPickerTotals = { fg = C.comment }
  G.SnacksPickerToggle = { fg = C.function_name }
  G.SnacksPickerSpecial = { fg = C.tag }
  G.SnacksPickerLabel = { fg = C.function_name }
  G.SnacksPickerDelim = { fg = C.gutter_fg }
  G.SnacksPickerDimmed = { fg = C.gutter_fg }

  -- Syntax in picker
  G.SnacksPickerCode = { fg = C.string }
  G.SnacksPickerComment = { fg = C.comment, italic = true }
  G.SnacksPickerBold = { bold = true }
  G.SnacksPickerItalic = { italic = true }

  -- LSP and diagnostics in picker
  G.SnacksPickerLspAttached = { fg = C.git_add }
  G.SnacksPickerLspAttachedBuf = { fg = C.git_add }
  G.SnacksPickerLspEnabled = { fg = C.git_add }
  G.SnacksPickerLspDisabled = { fg = C.error }
  G.SnacksPickerLspUnavailable = { fg = C.comment }

  G.SnacksPickerDiagnosticCode = { fg = C.comment }
  G.SnacksPickerDiagnosticSource = { fg = C.comment }

  -- Additional picker elements
  G.SnacksPickerBufNr = { fg = C.number }
  G.SnacksPickerBufType = { fg = C.keyword }
  G.SnacksPickerBufFlags = { fg = C.constant }
  G.SnacksPickerFileType = { fg = C.keyword }
  G.SnacksPickerTime = { fg = C.comment }
  G.SnacksPickerTree = { fg = C.gutter_fg }
  G.SnacksPickerBox = { fg = C.ui_border }
  G.SnacksPickerPickWin = { fg = C.function_name }
  G.SnacksPickerDesc = { fg = C.comment }
  G.SnacksPickerCmd = { fg = C.function_name }
  G.SnacksPickerRegister = { fg = C.constant }

  -- Keymap picker
  G.SnacksPickerKeymapMode = { fg = C.constant }
  G.SnacksPickerKeymapLhs = { fg = C.function_name }
  G.SnacksPickerKeymapRhs = { fg = C.string }
  G.SnacksPickerKeymapNowait = { fg = C.keyword }

  -- Man pages
  G.SnacksPickerManPage = { fg = C.function_name }
  G.SnacksPickerManSection = { fg = C.constant }
  G.SnacksPickerManDesc = { fg = C.comment }

  -- Autocommands
  G.SnacksPickerAuEvent = { fg = C.constant }
  G.SnacksPickerAuGroup = { fg = C.function_name }
  G.SnacksPickerAuPattern = { fg = C.string }

  -- Undo tree
  G.SnacksPickerUndoCurrent = { fg = C.function_name, bold = true }
  G.SnacksPickerUndoSaved = { fg = C.git_add }
  G.SnacksPickerUndoAdded = { fg = C.git_add }
  G.SnacksPickerUndoRemoved = { fg = C.git_delete }

  -- Notifications
  G.SnacksPickerNotificationMessage = { fg = C.fg }

  -- ============================================================================
  -- SNACKS.NVIM - DASHBOARD
  -- ============================================================================
  G.SnacksDashboardNormal = { link = "Normal" }
  G.SnacksDashboardIcon = { fg = C.function_name }
  G.SnacksDashboardDesc = { fg = C.fg }
  G.SnacksDashboardKey = { fg = C.keyword, bold = true }
  G.SnacksDashboardTitle = { fg = C.function_name, bold = true }
  G.SnacksDashboardHeader = { fg = C.constant }
  G.SnacksDashboardFooter = { fg = C.comment }
  G.SnacksDashboardTerminal = { link = "Normal" }

  -- ============================================================================
  -- SNACKS.NVIM - OTHER COMPONENTS
  -- ============================================================================
  -- Input
  G.SnacksInputNormal = { link = "NormalFloat" }
  G.SnacksInputBorder = { fg = C.ui_border, bg = C.ui_bg }
  G.SnacksInputTitle = { fg = C.function_name, bg = C.ui_bg, bold = true }

  -- Notifications
  G.SnacksNotifierHistory = { link = "NormalFloat" }
  G.SnacksNotifierBorder = { fg = C.ui_border, bg = C.ui_bg }
  G.SnacksNotifierTitle = { fg = C.function_name, bg = C.ui_bg, bold = true }
  G.SnacksNotifierIcon = { fg = C.function_name }

  -- Footer
  G.SnacksFooter = { fg = C.comment, bg = C.ui_bg }
  G.SnacksFooterKey = { fg = C.keyword, bold = true }
  G.SnacksFooterDesc = { fg = C.fg }

  -- Backdrop
  G.SnacksBackdrop = { bg = C.black }

  -- Diff
  G.SnacksDiffAdd = { fg = C.git_add }
  G.SnacksDiffConflict = { fg = C.error }
  G.SnacksDiffContext = { fg = C.comment }
  G.SnacksDiffDelete = { fg = C.git_delete }
  G.SnacksDiffHeader = { fg = C.function_name, bold = true }
  G.SnacksDiffLabel = { fg = C.constant }

  -- Debug
  G.SnacksDebug = { fg = C.error }
  G.SnacksDebugPrint = { fg = C.function_name }
  G.SnacksDebugIndent = { fg = C.gutter_fg }

  -- Dim
  G.SnacksDim = { fg = C.gutter_fg }

  return G
end

return M
