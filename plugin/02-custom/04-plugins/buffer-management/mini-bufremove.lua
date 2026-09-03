-- ┌────────────────┐
-- │ Mini.Bufremove │
-- └────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-bufremove
--
-- Description:
-- Neovim Lua plugin to remove buffers.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Remove buffers.
-- Opened files occupy space in tabline and buffer picker.
-- When not needed, they can be removed.
-- Example usage:
-- - `<Leader>bw` - completely wipeout current buffer (see `:h :bwipeout`)
-- - `<Leader>bW` - completely wipeout current buffer even if it has changes
-- - `<Leader>bd` - delete current buffer (see `:h :bdelete`)
later(function() require('mini.bufremove').setup() end)

-- vim: et sts=2 sw=2 ts=2
