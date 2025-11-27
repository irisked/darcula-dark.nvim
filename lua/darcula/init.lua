---@diagnostic disable: undefined-global

local M = {}

---Setup and configure the Darcula color scheme
---@param options table|nil User configuration options
M.setup = function(options)
  -- Setup configuration
  require("darcula.config").setup(options)

  -- Load the color scheme
  M.load()
end

---Load the color scheme
M.load = function()
  -- Clear existing highlights if needed
  vim.cmd("highlight clear")

  -- Check neovim version
  if vim.fn.has("nvim-0.8.3") == 0 then
    vim.cmd(
      'echohl WarningMsg | echo "Your neovim version is lower than 0.8.3, some features may not work correctly!" | echohl None'
    )
  end

  -- Set colorscheme name
  vim.g.colors_name = "darcula-dark"

  -- Enable true color support
  vim.o.termguicolors = true

  -- Set semantic token priority
  vim.highlight.priorities.semantic_tokens = 120

  -- Build color palette
  local palette = require("darcula.colors").build_palette()

  -- Get all highlight groups
  local groups = require("darcula.groups").get_groups()

  -- Apply all highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Set terminal colors
  M.set_terminal_colors(palette)
end

---Set terminal colors
---@param colors table Color palette
M.set_terminal_colors = function(colors)
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

---Get the color palette
---@return table
M.palette = function()
  return require("darcula.colors").build_palette()
end

return M
