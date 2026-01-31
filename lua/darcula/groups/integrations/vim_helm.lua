local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()

  local G = {}

  -- ============================================================================
  -- VIM-HELM HIGHLIGHTS (towolf/vim-helm)
  -- ============================================================================

  -- Template delimiters {{ }}
  G["helmBraces"] = { fg = C.keyword }

  -- Keywords: if, else, end, range, with, define, template, block
  G["helmStatement"] = { fg = C.keyword }
  G["helmConditional"] = { fg = C.keyword }
  G["helmRepeat"] = { fg = C.keyword }

  -- Variables: .Values, .Release, .Chart, etc.
  G["helmIdentifier"] = { fg = C.constant }

  -- Built-in functions: default, quote, include, required, etc.
  G["helmBuiltIn"] = { fg = C.function_name }
  G["helmFunction"] = { fg = C.function_name }

  -- Comments {{/* */}}
  G["helmComment"] = { fg = C.comment, italic = true }

  -- Special characters and operators
  G["helmSpecial"] = { fg = C.number }
  G["helmOperator"] = { fg = C.fg }

  -- String literals in templates
  G["helmString"] = { fg = C.string }

  -- Numbers in templates
  G["helmNumber"] = { fg = C.number }

  -- ============================================================================
  -- VIM YAML SYNTAX HIGHLIGHTS (built-in yaml.vim)
  -- ============================================================================

  -- Comments
  G["yamlTodo"] = { fg = C.todo, bold = true }
  G["yamlComment"] = { fg = C.comment, italic = true }

  -- Document markers
  G["yamlDocumentStart"] = { fg = C.keyword } -- ---
  G["yamlDocumentEnd"] = { fg = C.keyword } -- ...

  -- Directives
  G["yamlDirectiveName"] = { fg = C.keyword }
  G["yamlTAGDirective"] = { fg = C.keyword }
  G["yamlTagHandle"] = { fg = C.string }
  G["yamlTagPrefix"] = { fg = C.string }
  G["yamlYAMLDirective"] = { fg = C.keyword }
  G["yamlReservedDirective"] = { fg = C.error }
  G["yamlYAMLVersion"] = { fg = C.number }

  -- Strings
  G["yamlString"] = { fg = C.string }
  G["yamlFlowString"] = { fg = C.string }
  G["yamlFlowStringDelimiter"] = { fg = C.string }
  G["yamlBlockString"] = { fg = C.string }
  G["yamlEscape"] = { fg = C.number }
  G["yamlSingleEscape"] = { fg = C.number }

  -- Mapping keys
  G["yamlMappingKey"] = { fg = C.constant }
  G["yamlBlockMappingKey"] = { fg = C.constant }
  G["yamlFlowMappingKey"] = { fg = C.constant }

  -- Mapping delimiters and special
  G["yamlMappingKeyStart"] = { fg = C.keyword } -- ?
  G["yamlMappingMerge"] = { fg = C.keyword } -- <<
  G["yamlKeyValueDelimiter"] = { fg = C.fg } -- :
  G["yamlBlockMappingKeyStart"] = { fg = C.keyword }
  G["yamlBlockMappingMerge"] = { fg = C.keyword }
  G["yamlBlockMappingDelimiter"] = { fg = C.fg }
  G["yamlFlowMappingKeyStart"] = { fg = C.keyword }
  G["yamlFlowMappingMerge"] = { fg = C.keyword }
  G["yamlFlowMappingDelimiter"] = { fg = C.fg }

  -- Flow indicators and collection
  G["yamlFlowIndicator"] = { fg = C.fg } -- { } [ ]
  G["yamlBlockCollectionItemStart"] = { fg = C.keyword } -- -
  G["yamlBlockScalarHeader"] = { fg = C.keyword } -- | >

  -- Constants
  G["yamlConstant"] = { fg = C.keyword }
  G["yamlNull"] = { fg = C.keyword }
  G["yamlBool"] = { fg = C.keyword }

  -- Anchors and aliases
  G["yamlAnchor"] = { fg = C.decorator }
  G["yamlAlias"] = { fg = C.decorator }
  G["yamlNodeTag"] = { fg = C.class_name }

  -- Numbers
  G["yamlInteger"] = { fg = C.number }
  G["yamlFloat"] = { fg = C.number }
  G["yamlTimestamp"] = { fg = C.number }

  -- Plain scalar (unquoted values)
  G["yamlPlainScalar"] = { fg = C.fg }

  -- ============================================================================
  -- TREESITTER YAML HIGHLIGHTS
  -- ============================================================================

  -- Keys/properties
  G["@property.yaml"] = { fg = C.constant }
  G["@field.yaml"] = { fg = C.constant }

  -- Values
  G["@string.yaml"] = { fg = C.string }
  G["@number.yaml"] = { fg = C.number }
  G["@number.float.yaml"] = { fg = C.number }
  G["@boolean.yaml"] = { fg = C.keyword }
  G["@constant.builtin.yaml"] = { fg = C.keyword } -- null, ~

  -- Punctuation
  G["@punctuation.delimiter.yaml"] = { fg = C.fg } -- colons
  G["@punctuation.special.yaml"] = { fg = C.keyword } -- anchors &, aliases *
  G["@punctuation.bracket.yaml"] = { fg = C.fg } -- [ ] { }

  -- Comments
  G["@comment.yaml"] = { fg = C.comment, italic = true }

  -- Tags and anchors
  G["@tag.yaml"] = { fg = C.class_name }
  G["@label.yaml"] = { fg = C.decorator } -- anchors/aliases names

  -- Type (for anchors/aliases)
  G["@type.yaml"] = { fg = C.decorator }

  return G
end

return M
