# Darcula Dark Theme - New Modular Structure

This document explains the new modular structure of the Darcula Dark theme, inspired by [Nordic.nvim](https://github.com/AlexvZyl/nordic.nvim).

## Directory Structure

```
lua/darcula/
├── init.lua                    # Main entry point
├── config.lua                  # Configuration options
├── colors/
│   ├── init.lua               # Color palette builder
│   └── darcula.lua            # Base color definitions
└── groups/
    ├── init.lua               # Highlight group orchestrator
    ├── native.lua             # Base Neovim highlight groups
    └── integrations/          # Plugin-specific highlights
        ├── treesitter.lua
        ├── telescope.lua
        ├── gitsigns.lua
        ├── nvim_cmp.lua
        ├── neo_tree.lua
        ├── nvim_tree.lua
        ├── indent_blankline.lua
        └── snacks.lua
```

## Usage

### Basic Setup

```lua
-- In your init.lua or wherever you configure plugins
require("darcula").setup()
```

### Custom Configuration

```lua
require("darcula").setup({
  -- Styling options
  bold_keywords = false,
  italic_comments = true,
  transparent = {
    bg = false,    -- Transparent background
    float = false, -- Transparent floating windows
  },

  -- Customization hooks
  on_palette = function(palette)
    -- Modify base colors before processing
    palette.keyword = "#FF0000"
  end,

  after_palette = function(palette)
    -- Modify extended palette after processing
    palette.bg_float = palette.ui_bg
  end,

  on_highlight = function(highlights, palette)
    -- Modify highlight groups before applying
    highlights.Comment = { fg = palette.comment, italic = false }
  end,

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
})
```

## Architecture

### 1. Color System

- **Base Palette** (`colors/darcula.lua`): Contains all raw color definitions from IntelliJ IDEA Darcula
- **Palette Builder** (`colors/init.lua`): Creates semantic color mappings for easier highlight group definitions

### 2. Highlight Groups

- **Native** (`groups/native.lua`): Base Neovim highlight groups for syntax, LSP, diagnostics, UI elements, diff, etc.
- **Integrations** (`groups/integrations/`): Plugin-specific highlight groups loaded based on configuration

### 3. Configuration System

Three customization hooks are available:
- `on_palette`: Modify base colors before processing
- `after_palette`: Adjust extended palette colors
- `on_highlight`: Override highlight groups before application

## Benefits of New Structure

1. **Modular**: Easy to maintain and extend with new plugin integrations
2. **Configurable**: Granular control over which integrations to load
3. **Customizable**: Multiple hooks for user customization at different stages
4. **Performance**: Only loads highlight groups for enabled integrations
5. **Maintainable**: Clear separation of concerns (colors, groups, config)

## Migration from Old Structure

The old monolithic `lua/darcula.lua` has been backed up to `lua/darcula.lua.backup`. The new structure maintains backward compatibility - existing configurations should work without changes.

## Adding New Integrations

To add support for a new plugin:

1. Create a new file in `lua/darcula/groups/integrations/plugin_name.lua`
2. Export a `get()` function that returns a table of highlight groups
3. Add the integration to `config.lua` defaults
4. Add the integration to the loader in `groups/init.lua`

Example:

```lua
-- lua/darcula/groups/integrations/my_plugin.lua
local M = {}

function M.get()
  local C = require("darcula.colors").build_palette()
  local G = {}

  G.MyPluginHighlight = { fg = C.function_name, bold = true }

  return G
end

return M
```

## Color Palette Access

You can access the color palette programmatically:

```lua
local palette = require("darcula").palette()
print(palette.keyword) -- "#DC8842"
```

## Credits

Structure inspired by [Nordic.nvim](https://github.com/AlexvZyl/nordic.nvim) by Alex van Zyl.
