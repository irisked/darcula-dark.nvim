---@class Config
---@field opt string Your config option
local config = {}

local colors = {
  light_gray = "#EEEEEE", -- 5
  white = "#FFFFFF",
  ghost_white = "#E8E8E8",
  purple = "#9876aa",
  battleship_gray = "#4B4E4F", -- 27
  davys_grey = "#666666", -- 2
  gunmetal = "#484848", -- 11
  gray = "#808080", -- 18
  cadet_grey = "#ABB2BF", -- 12
  dark_khaki = "#D3B987", -- 30
  silver_chalice = "#C9D0D3", -- 51
  atomic_tangerine = "#FFC66D", -- 1
  malachite = "#4DD158", -- 1
  electric_lime = "#A9FF68", -- 8
  metallic_silver = "#6D8086", -- 7
  sangria = "#881515", -- 2
  powder_blue = "#B3DEEF", -- 31
  electric_cyan = "#00F1F5", -- 15
  blue_lagoon = "#2AC3DE", -- 1
  dark_lava = "#BF4537", -- 1
  green = "#008000", -- 2
  ochre = "#CC7832", -- 4
  raisin_black = "#392A52", -- 1
  granny_smith_apple = "#98BE65", -- 71
  little_boy_blue = "#7BA1C0", -- 1
  myrtle = "#2E5049", -- 1
  light_crimson = "#AD475F", -- 1
  rhythm = "#151838", -- 1
  lemon_glacier = "#C9D05C", -- 22
  yellow = "#FFFF00", -- 2
  dark_coral = "#C95942", -- 1
  jet = "#242424", -- 5
  cadet = "#596F77", -- 16
  celestial_blue = "#2B8DB3", -- 1
  viridian_green = "#2F7366", -- 1
  fashion_fuchsia = "#F70067", -- 4
  black = "#000000", -- 21
  slate_gray = "#73797E", -- 5
  deep_magenta = "#C955AE", -- 1
  camouflage_green = "#6A8759", -- 1
  dark_apricot = "#DC9656", -- 16
  gray_asparagus = "#303030", -- 18
  dark_slate_gray = "#344F69", -- 1
  leather_brown = "#A16946", -- 6
  bright_red = "#F43753", -- 57
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
  -- colors
  -- Highlight groups
  local hi = vim.api.nvim_set_hl

  -- lsp semantics token
  hi(0, "@attribute", { link = "TSAttribute" })
  hi(0, "@boolean", { link = "TSBoolean" })
  hi(0, "@character", { link = "TSCharacter" })
  hi(0, "@character.special", { link = "SpecialChar" })
  hi(0, "@class", { link = "TSType" })
  hi(0, "@comment", { link = "TSComment" })
  hi(0, "@conditional", { link = "TSConditional" })
  hi(0, "@constant", { link = "TSConstant" })
  hi(0, "@constant.builtin", { link = "TSConstantBuiltin" })
  hi(0, "@constant.macro", { link = "TSConstant" })
  hi(0, "@constructor", { link = "TSConstructor" })
  hi(0, "@decorator", { link = "Identifier" })
  hi(0, "@enum", { link = "TSType" })
  hi(0, "@enumMember", { link = "Constant" })
  hi(0, "@error", { link = "TSError" })
  hi(0, "@event", { link = "Identifier" })
  hi(0, "@exception", { link = "TSException" })
  hi(0, "@field", { link = "TSField" })
  hi(0, "@float", { link = "TSFloat" })
  hi(0, "@function", { link = "TSFunction" })
  hi(0, "@function.builtin", { link = "TSFuncBuiltin" })
  hi(0, "@function.call", { link = "TSFunctionCall" })
  hi(0, "@function.macro", { link = "TSFuncMacro" })
  hi(0, "@include", { link = "TSInclude" })
  hi(0, "@interface", { link = "Structure" })
  hi(0, "@keyword", { link = "TSKeyword" })
  hi(0, "@keyword.function", { link = "TSKeywordFunction" })
  hi(0, "@keyword.operator", { link = "TSKeywordOperator" })
  hi(0, "@keyword.return", { link = "TSKeyword" })
  hi(0, "@label", { link = "TSLabel" })
  hi(0, "@method", { link = "TSMethod" })
  hi(0, "@method.call", { link = "TSMethodCall" })
  hi(0, "@modifier", { link = "Identifier" })
  hi(0, "@namespace", { link = "TSNamespace" })
  hi(0, "@none", { link = "TSNone" })
  hi(0, "@number", { link = "TSNumber" })
  hi(0, "@operator", { link = "TSOperator" })
  hi(0, "@parameter", { link = "TSParameter" })
  hi(0, "@property", { link = "TSProperty" })
  hi(0, "@punctuation.bracket", { link = "TSPunctBracket" })
  hi(0, "@punctuation.delimiter", { link = "TSPunctDelimiter" })
  hi(0, "@punctuation.special", { link = "TSPunctSpecial" })
  hi(0, "@regexp", { link = "TSStringRegex" })
  hi(0, "@repeat", { link = "TSRepeat" })
  hi(0, "@string", { link = "TSString" })
  hi(0, "@string.escape", { link = "TSStringEscape" })
  hi(0, "@string.regex", { link = "TSStringRegex" })
  hi(0, "@string.special", { link = "SpecialChar" })
  hi(0, "@struct", { link = "TSType" })
  hi(0, "@symbol", { link = "TSSymbol" })
  hi(0, "@tag", { link = "TSTag" })
  hi(0, "@tag.attribute", { link = "TSAttribute" })
  hi(0, "@tag.delimiter", { link = "TSTagDelimiter" })
  hi(0, "@text", { link = "TSText" })
  hi(0, "@text.danger", { link = "DiagnosticError" })
  hi(0, "@text.emphasis", { link = "TSEmphasis" })
  hi(0, "@text.environment", { link = "Macro" })
  hi(0, "@text.environment.name", { link = "Type" })
  hi(0, "@text.literal", { link = "TSLiteral" })
  hi(0, "@text.math", { link = "Number" })
  hi(0, "@text.note", { link = "Tag" })
  hi(0, "@text.reference", { link = "TSParameterReference" })
  hi(0, "@text.strike", { link = "TSStrike" })
  hi(0, "@text.strong", { link = "TSStrong" })
  hi(0, "@text.title", { link = "TSTitle" })
  hi(0, "@text.todo", { link = "Todo" })
  hi(0, "@text.underline", { link = "TSUnderline" })
  hi(0, "@text.uri", { link = "TSURI" })
  hi(0, "@text.warning", { link = "DiagnosticWarn" })
  hi(0, "@type", { link = "TSType" })
  hi(0, "@type.builtin", { link = "TSTypeBuiltin" })
  hi(0, "@type.definition", { link = "TSTypeDefinition" })
  hi(0, "@type.qualifier", { link = "TSType" })
  hi(0, "@typeParameter", { link = "Type" })
  hi(0, "@variable", { link = "TSVariable" })
  hi(0, "@variable.builtin", { link = "TSVariableBuiltin" })
  hi(0, "@lsp.type.namespace", { link = "TSNamespace" })
  hi(0, "@lsp.type.variable", {})
  hi(0, "@lsp.type.field", { link = "TSField" })
  hi(0, "@lsp.type.parameter", { link = "TSVariable" })
  hi(0, "@lsp.type.type", {})
  -- hi(0, "@lsp.type.field", {})
  -- hi(0, "@lsp.type.function", {})
  -- hi(0, "@lsp.type.method", {})
  -- hi(0, "@lsp.type.comment", {})
  -- hi(0, "@lsp.typemod.variable.defaultLibrary", { link = "TSKeyword" })
  -- hi(0, "@lsp.mod.defaultLibrary.go", { link = "TSKeyword" })
  hi(0, "@lsp.type.property", {})
  hi(0, "yamlBlockMappingKey", { link = "TSProperty" })
  hi(0, "gotplAction", { link = "TSString" })

  hi(0, "Bold", { bold = true })
  hi(0, "Boolean", { fg = colors.dark_apricot })
  hi(0, "Character", { fg = colors.bright_red })

  -- telescope
  hi(0, "TelescopeBorder", { bg = colors.wite, fg = colors.white })
  hi(0, "TelescopeNormal", { bg = colors.jet, fg = colors.silver_chalice })
  hi(0, "TelescopePreviewLine", { bg = colors.gunmetal })
  hi(0, "TelescopePreviewTitle", { bg = colors.ochre, fg = colors.jet })
  hi(0, "TelescopePromptBorder", { bg = colors.jet, fg = colors.white })
  hi(0, "TelescopePromptNormal", { bg = colors.jet, fg = colors.silver_chalice })
  hi(0, "TelescopePromptPrefix", { bg = colors.jet, fg = colors.bright_red })
  hi(0, "TelescopePromptTitle", { bg = colors.ochre, fg = colors.jet })
  hi(0, "TelescopeResultsTitle", { bg = colors.ochre, fg = colors.jet })
  hi(0, "TelescopeSelection", { bg = colors.gunmetal })
  hi(0, "TermCursor", { bg = colors.light_gray, fg = colors.gray_asparagus })
  hi(0, "TermCursorNC", { bg = colors.light_gray, fg = colors.gray_asparagus })
  hi(0, "Title", { ctermfg = 225, fg = colors.powder_blue })
  hi(0, "Todo", { bg = colors.gray_asparagus, ctermbg = 11, ctermfg = 0, fg = colors.battleship_gray })
  hi(0, "TooLong", { fg = colors.bright_red })
  hi(0, "TreesitterContext", { bg = colors.gray_asparagus, italic = true })
  hi(0, "Typedef", { fg = colors.celestial_blue })
  hi(0, "Underlined", { ctermfg = 81, fg = colors.bright_red, underline = true })
  hi(0, "User1", { bg = colors.gunmetal, fg = colors.bright_red })
  hi(0, "User2", { bg = colors.gunmetal, fg = colors.dark_khaki })
  hi(0, "User3", { bg = colors.gunmetal, fg = colors.silver_chalice })
  hi(0, "User4", { bg = colors.gunmetal, fg = colors.maya_blue })
  hi(0, "User5", { bg = colors.gunmetal, fg = colors.silver_chalice })
  hi(0, "User6", { bg = colors.gray_asparagus, fg = colors.silver_chalice })
  hi(0, "User7", { bg = colors.gunmetal, fg = colors.silver_chalice })
  hi(0, "User8", { bg = colors.gunmetal, fg = colors.gray_asparagus })
  hi(0, "User9", { bg = colors.gunmetal, fg = colors.gray_asparagus })
  hi(0, "VertSplit", { fg = colors.silver_chalice })
  hi(0, "Visual", { bg = colors.gunmetal, ctermbg = 242 })
  hi(0, "VisualNOS", { fg = colors.bright_red })
  hi(0, "WarningMsg", { ctermfg = 224, fg = colors.bright_red })
  hi(0, "WildMenu", { bg = colors.battleship_gray, ctermbg = 11, ctermfg = 0, fg = colors.bright_red })
  hi(0, "WinBar", { fg = colors.silver_chalice })
  hi(0, "WinBarNC", { fg = colors.cadet_grey })
  hi(0, "gitcommitBranch", { bold = true, fg = colors.dark_apricot })
  hi(0, "gitcommitComment", { fg = colors.gray_asparagus })
  hi(0, "gitcommitDiscarded", { fg = colors.gray_asparagus })
  hi(0, "gitcommitDiscardedFile", { bold = true, fg = colors.bright_red })
  hi(0, "gitcommitDiscardedType", { fg = colors.powder_blue })
  hi(0, "gitcommitHeader", { fg = colors.dark_khaki })
  hi(0, "gitcommitOverflow", { fg = colors.bright_red })
  hi(0, "gitcommitSelected", { fg = colors.gray_asparagus })
  hi(0, "gitcommitSelectedFile", { bold = true, fg = colors.lemon_glacier })
  hi(0, "gitcommitSelectedType", { fg = colors.powder_blue })
  hi(0, "gitcommitSummary", { fg = colors.lemon_glacier })
  hi(0, "gitcommitUnmergedFile", { bold = true, fg = colors.bright_red })
  hi(0, "gitcommitUnmergedType", { fg = colors.powder_blue })
  hi(0, "gitcommitUntracked", { fg = colors.gray_asparagus })
  hi(0, "gitcommitUntrackedFile", { fg = colors.battleship_gray })
  hi(0, "iCursor", { bg = colors.celestial_blue, fg = colors.white })
  hi(0, "lCursor", { bg = colors.light_gray, fg = colors.gray_asparagus })

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
