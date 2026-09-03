-- ┌──────────────────┐
-- │ Mini.Indentscope │
-- └──────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-indentscope
--
-- Description:
-- Neovim Lua plugin to visualize and operate on indent scope.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Visualize and work with indent scope.
-- It visualizes indent scope "at cursor" with animated vertical line.
-- Provides relevant motions and textobjects.
-- Example usage:
-- - `cii` - *c*hange *i*nside *i*ndent scope
-- - `Vaiai` - *V*isually select *a*round *i*ndent scope and then again
--   reselect *a*round new *i*indent scope
-- - `[i` / `]i` - navigate to scope's top / bottom
--
-- See also:
-- - `:h MiniIndentscope.gen_animation` - available animation rules
later(function() require('mini.indentscope').setup() end)

-- vim: et sts=2 sw=2 ts=2
