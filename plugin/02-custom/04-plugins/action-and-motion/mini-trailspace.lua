-- ┌─────────────────┐
-- │ Mini.Trailspace │
-- └─────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-trailspace
--
-- Description:
-- Neovim Lua plugin to manage trailspace (highlight and remove).
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Highlight and remove trailspace.
-- Temporarily stops highlighting in Insert mode to reduce noise when typing.
-- Example usage:
-- - `<Leader>ot` - trim all trailing whitespace in a buffer
later(function() require('mini.trailspace').setup() end)

-- vim: et sts=2 sw=2 ts=2
