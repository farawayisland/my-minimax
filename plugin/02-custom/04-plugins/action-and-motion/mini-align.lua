-- ┌────────────┐
-- │ Mini.Align │
-- └────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-align
--
-- Description:
-- Neovim Lua plugin to align text interactively.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Align text interactively.
-- Example usage:
-- - `gaip,` - `ga` (align operator) *i*nside *p*aragraph by comma
-- - `gAip` - start interactive alignment on the paragraph.
--   Choose how to split, justify, and merge string parts.
--   Press `<CR>` to make it permanent, press `<Esc>` to go back to initial
--   state.
--
-- See also:
-- - `:h MiniAlign-example` - hands-on list of examples to practice aligning
-- - `:h MiniAlign.gen_step` - list of support step customizations
-- - `:h MiniAlign-algorithm` - how alignment is done on algorithmic level
later(function() require('mini.align').setup() end)

-- vim: et sts=2 sw=2 ts=2
