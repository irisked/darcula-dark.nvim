local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- ============================================================================
  -- TREESITTER HIGHLIGHTS
  -- ============================================================================

  -- Comments
  G["@comment"] = { link = "Comment" }
  G["@comment.documentation"] = { fg = C.doc_comment, italic = true }
  G["@comment.note"] = { fg = C.info, bold = true }
  G["@comment.error"] = { fg = C.error, bold = true }
  G["@comment.hint"] = { fg = C.hint, bold = true }
  G["@comment.info"] = { fg = C.info, bold = true }
  G["@comment.warning"] = { fg = C.warning, bold = true }
  G["@comment.todo"] = { fg = C.todo, bold = true }

  -- Operators and punctuation
  G["@operator"] = { fg = C.fg }
  G["@punctuation.delimiter"] = { fg = C.fg }
  G["@punctuation.bracket"] = { fg = C.fg }
  G["@punctuation.special"] = { fg = C.fg }
  G["@punctuation.special.markdown"] = { fg = C.keyword, bold = true }

  -- Literals
  G["@string"] = { fg = C.string }
  G["@string.documentation"] = { link = "@string" }
  G["@string.escape"] = { fg = C.number }
  G["@string.regexp"] = { fg = C.number }
  G["@string.special"] = { fg = C.tag }
  G["@character"] = { fg = C.string }
  G["@character.special"] = { fg = C.tag }
  G["@number"] = { fg = C.number }
  G["@number.float"] = { fg = C.number }
  G["@boolean"] = { fg = C.keyword }

  -- Functions
  G["@function"] = { fg = C.function_name }
  G["@function.builtin"] = { fg = C.function_name, bold = true }
  G["@function.call"] = { fg = C.function_name }
  G["@function.macro"] = { fg = C.keyword }
  G["@function.method"] = { fg = C.function_name }
  G["@function.method.call"] = { fg = C.function_name }
  G["@constructor"] = { fg = C.function_name }
  G["@parameter"] = { fg = C.white }
  G["@parameter.builtin"] = { fg = C.keyword, bold = true }

  -- Keywords
  G["@keyword"] = { fg = C.keyword }
  G["@keyword.conditional"] = { link = "@keyword" }
  G["@keyword.coroutine"] = { link = "@keyword" }
  G["@keyword.debug"] = { link = "@keyword" }
  G["@keyword.directive"] = { link = "@keyword" }
  G["@keyword.directive.define"] = { link = "@keyword" }
  G["@keyword.exception"] = { link = "@keyword" }
  G["@keyword.export"] = { link = "@keyword" }
  G["@keyword.function"] = { fg = C.keyword }
  G["@keyword.import"] = { link = "@keyword" }
  G["@keyword.operator"] = { link = "@keyword" }
  G["@keyword.repeat"] = { link = "@keyword" }
  G["@keyword.return"] = { link = "@keyword" }
  G["@keyword.storage"] = { link = "@keyword" }

  -- Types
  G["@type"] = { fg = C.class_name }
  G["@type.builtin"] = { fg = C.keyword }
  G["@type.definition"] = { fg = C.class_name }
  G["@type.qualifier"] = { fg = C.keyword }

  -- Identifiers
  G["@variable"] = { fg = C.white }
  G["@variable.builtin"] = { fg = C.keyword, bold = true }
  G["@variable.parameter"] = { fg = C.white }
  G["@variable.member"] = { fg = C.constant }
  G["@constant"] = { fg = C.constant }
  G["@constant.builtin"] = { fg = C.keyword, bold = true }
  G["@constant.macro"] = { fg = C.constant }
  G["@module"] = { fg = C.fg }
  G["@label"] = { fg = C.constant }

  -- Attributes and properties
  G["@attribute"] = { fg = C.decorator }
  G["@property"] = { fg = C.constant }
  G["@field"] = { fg = C.constant }

  -- Tags (HTML/XML)
  G["@tag"] = { fg = C.tag }
  G["@tag.attribute"] = { fg = C.attribute }
  G["@tag.delimiter"] = { fg = C.fg }

  -- Markup (Markdown, etc.)
  G["@markup"] = { link = "Normal" }
  G["@markup.strong"] = { bold = true }
  G["@markup.italic"] = { italic = true }
  G["@markup.emphasis"] = { italic = true }
  G["@markup.strikethrough"] = { strikethrough = true }
  G["@markup.underline"] = { underline = true }
  G["@markup.heading"] = { fg = C.function_name, bold = true }
  G["@markup.heading.1"] = { fg = C.function_name, bold = true }
  G["@markup.heading.2"] = { fg = C.keyword, bold = true }
  G["@markup.heading.3"] = { fg = C.constant, bold = true }
  G["@markup.heading.4"] = { fg = C.string }
  G["@markup.heading.5"] = { fg = C.number, italic = true }
  G["@markup.heading.6"] = { fg = C.tag, italic = true }
  G["@markup.link"] = { fg = C.link, underline = true }
  G["@markup.link.url"] = { fg = C.link, underline = true }
  G["@markup.link.label"] = { fg = C.tag }
  G["@markup.link.label.symbol"] = { fg = C.constant }
  G["@markup.raw"] = { fg = C.string }
  G["@markup.raw.markdown_inline"] = { fg = C.string }
  G["@markup.math"] = { fg = C.number }
  G["@markup.list"] = { fg = C.keyword }
  G["@markup.list.checked"] = { fg = C.git_add }
  G["@markup.list.unchecked"] = { fg = C.gutter_fg }
  G["@markup.environment"] = { fg = C.keyword }
  G["@markup.environment.name"] = { fg = C.type }

  -- Text
  G["@text"] = { link = "Normal" }
  G["@text.strong"] = { bold = true }
  G["@text.emphasis"] = { italic = true }
  G["@text.underline"] = { underline = true }
  G["@text.strike"] = { strikethrough = true }
  G["@text.title"] = { link = "Title" }
  G["@text.uri"] = { fg = C.link, underline = true }
  G["@text.literal"] = { fg = C.string }
  G["@text.literal.markdown_inline"] = { fg = C.string }
  G["@text.reference"] = { fg = C.link }
  G["@text.todo.unchecked"] = { fg = C.number }
  G["@text.todo.checked"] = { fg = C.git_add }
  G["@text.warning"] = { fg = C.warning }
  G["@text.danger"] = { fg = C.error }
  G["@text.diff.add"] = { link = "DiffAdd" }
  G["@text.diff.delete"] = { link = "DiffDelete" }
  G["@text.todo"] = { link = "Todo" }
  G["@text.note"] = { link = "Note" }

  -- Diff
  G["@diff.plus"] = { fg = C.git_add }
  G["@diff.minus"] = { fg = C.git_delete }
  G["@diff.delta"] = { fg = C.git_change }

  -- ============================================================================
  -- LSP SEMANTIC TOKENS
  -- ============================================================================
  --
  G["@lsp.type.variable.go"] = {}
  G["@lsp.type.namespace.go"] = { fg = C.white }
  G["@lsp.type.type.go"] = {}
  G["@lsp.type.class.go"] = {}
  G["@lsp.type.enum.go"] = {}
  G["@lsp.type.interface.go"] = {}
  G["@lsp.type.struct.go"] = {}
  G["@lsp.type.parameter.go"] = {}
  G["@lsp.type.variable.go"] = {}
  G["@lsp.type.property.go"] = {}
  G["@lsp.type.enumMember.go"] = {}
  G["@lsp.type.function.go"] = {}
  G["@lsp.type.method.go"] = {}
  G["@lsp.type.macro.go"] = {}
  G["@lsp.type.decorator.go"] = {}
  G["@lsp.type.comment.go"] = {}
  G["@lsp.type.keyword.go"] = {}
  G["@lsp.type.operator.go"] = {}
  G["@lsp.type.boolean.go"] = {}
  G["@lsp.type.number.go"] = {}
  G["@lsp.type.string.go"] = {}
  G["@lsp.type.variable.go"] = {}

  G["@lsp.type.type.terraform"] = {}
  G["@lsp.type.enumMember.terraform"] = {}
  G["@lsp.type.parameter.terraform"] = {}
  G["@lsp.type.variable.terraform"] = {}
  G["@lsp.type.property.terraform"] = {}

  return G
end

return M
