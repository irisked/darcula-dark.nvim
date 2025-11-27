---@diagnostic disable: undefined-global

local M = {}

---Default configuration options
M.defaults = {
  -- Styling options
  bold_keywords = false,
  italic_comments = true,
  transparent = {
    bg = false,
    float = false,
  },

  -- Customization hooks
  on_palette = nil, -- function(palette) end - Modify base palette before processing
  after_palette = nil, -- function(palette) end - Modify extended palette after processing
  on_highlight = nil, -- function(highlights, palette) end - Modify highlights before applying

  -- Plugin integrations (all enabled by default)
  integrations = {
    treesitter = true,
    lsp = true,
    telescope = true,
    neo_tree = true,
    nvim_tree = true,
    gitsigns = true,
    nvim_cmp = true,
    indent_blankline = true,
    snacks = true,
  },
}

---@type table
M.options = {}

---Setup configuration
---@param options table|nil User configuration options
M.setup = function(options)
  M.options = vim.tbl_deep_extend("force", M.defaults, options or {})
end

-- Initialize with defaults
M.setup()

return M
