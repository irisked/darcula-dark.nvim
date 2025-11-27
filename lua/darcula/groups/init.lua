local M = {}

---Load and merge all highlight groups
---@return table
M.get_groups = function()
  local config = require("darcula.config")
  local palette = require("darcula.colors").build_palette()

  -- Start with native highlight groups
  local groups = require("darcula.groups.native").get_groups()

  -- Load plugin integrations based on configuration
  local integrations = {
    treesitter = "darcula.groups.integrations.treesitter",
    gitsigns = "darcula.groups.integrations.gitsigns",
    telescope = "darcula.groups.integrations.telescope",
    nvim_cmp = "darcula.groups.integrations.nvim_cmp",
    neo_tree = "darcula.groups.integrations.neo_tree",
    nvim_tree = "darcula.groups.integrations.nvim_tree",
    indent_blankline = "darcula.groups.integrations.indent_blankline",
    snacks = "darcula.groups.integrations.snacks",
  }

  -- Merge integration highlight groups
  for name, module_path in pairs(integrations) do
    if config.options.integrations[name] then
      local ok, integration = pcall(require, module_path)
      if ok and integration.get then
        local integration_groups = integration.get()
        groups = vim.tbl_extend("force", groups, integration_groups)
      end
    end
  end

  -- Allow user customization
  if config.options.on_highlight then
    config.options.on_highlight(groups, palette)
  end

  return groups
end

return M
