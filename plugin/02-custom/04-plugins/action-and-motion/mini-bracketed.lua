-- ┌────────────────┐
-- │ Mini.Bracketed │
-- └────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-bracketed
--
-- Description:
-- Neovim Lua plugin to go forward/backward with square brackets.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Go forward/backward with square brackets.
-- Implements consistent sets of mappings
-- for selected targets (like buffers, diagnostic, quickfix list entries, etc.).
-- Example usage:
-- - `]b` - go to next buffer
-- - `[j` - go to previous jump inside current buffer
-- - `[Q` - go to first entry of quickfix list
-- - `]X` - go to last conflict marker in a buffer
--
-- See also:
-- - `:h MiniBracketed` - overall mapping design and list of targets
later(function() require('mini.bracketed').setup() end)

-- vim: et sts=2 sw=2 ts=2
