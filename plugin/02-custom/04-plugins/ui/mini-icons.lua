-- ┌────────────┐
-- │ Mini.Icons │
-- └────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-icons
--
-- Description:
-- Icon provider.
-- Part of `mini.nvim` library.

-- Make concise helpers for installing/adding plugins in two stages.
local now, later = Config.now, Config.later

-- Icon provider.
-- Usually no need to use manually.
-- It is used by plugins like `mini.pick`, `mini.files`, `mini.statusline`, and
-- others.
now(function()
  -- Set up to not prefer extension-based icon for some extensions
  local ext3_blocklist = { scm = true, txt = true, yml = true }
  local ext4_blocklist = { json = true, yaml = true }
  require('mini.icons').setup({
    use_file_extension = function(ext, _)
      return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
    end,
  })

  -- Mock `nvim-tree/nvim-web-devicons` for plugins without `mini.icons` support.
  -- Not needed for `mini.nvim` or MiniMax, but might be useful for others.
  later(MiniIcons.mock_nvim_web_devicons)

  -- Add LSP kind icons.
  -- Useful for `mini.completion`.
  later(MiniIcons.tweak_lsp_kind)
end)

-- vim: et sts=2 sw=2 ts=2
