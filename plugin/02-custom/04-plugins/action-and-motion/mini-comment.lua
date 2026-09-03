-- ┌──────────────┐
-- │ Mini.Comment │
-- └──────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-comment
--
-- Description:
-- Neovim Lua plugin for fast and familiar per-line commenting.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Comment lines.
-- Provides functionality to work with commented lines.
-- Uses `:h 'commentstring'` option to infer comment structure.
-- Example usage:
-- - `gcip` - toggle comment (`gc`) *i*inside *p*aragraph
-- - `vapgc` - *v*isually select *a*round *p*aragraph and toggle comment (`gc`)
-- - `gcgc` - uncomment (`gc`, operator) comment block at cursor (`gc`,
--            textobject)
--
-- The built-in `:h commenting` is based on `mini.comment`.
-- Yet this module is still enabled as it provides more customization
-- opportunities.
later(function() require('mini.comment').setup() end)

-- vim: et sts=2 sw=2 ts=2
