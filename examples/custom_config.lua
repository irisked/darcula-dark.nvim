-- Example: Custom Darcula configuration

-- Basic setup (use defaults)
require("darcula").setup()

-- Or with custom options:
require("darcula").setup({
  -- Styling options
  bold_keywords = true,      -- Make keywords bold
  italic_comments = true,    -- Make comments italic (default)

  -- Transparency settings
  transparent = {
    bg = false,              -- Set to true for transparent background
    float = false,           -- Set to true for transparent floating windows
  },

  -- Modify base colors
  on_palette = function(palette)
    -- Make keywords brighter
    palette.keyword = "#FF8C42"
    -- Adjust background
    -- palette.bg = "#1a1a1a"
  end,

  -- Modify extended palette
  after_palette = function(palette)
    -- Adjust semantic colors
    -- palette.bg_float = palette.bg
  end,

  -- Customize specific highlight groups
  on_highlight = function(highlights, palette)
    -- Make comments less italic
    -- highlights.Comment = { fg = palette.comment, italic = false }

    -- Custom keyword highlighting
    -- highlights.Keyword = { fg = palette.keyword, bold = true, italic = true }

    -- Adjust LSP diagnostics
    -- highlights.DiagnosticError = { fg = "#FF0000", bold = true }
  end,

  -- Control which integrations to load
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
})

-- Access the color palette programmatically
local palette = require("darcula").palette()

-- Use colors in your own highlights
vim.api.nvim_set_hl(0, "MyCustomGroup", {
  fg = palette.function_name,
  bg = palette.bg,
  bold = true,
})
