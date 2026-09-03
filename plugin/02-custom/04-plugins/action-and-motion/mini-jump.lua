-- ┌───────────┐
-- │ Mini.Jump │
-- └───────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-jump
--
-- Description:
-- Neovim Lua plugin to jump forward/backward to a single character.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Jump to next/previous single character.
-- It implements "smarter `fFtT` keys" (see `:h f`) that work across multiple
-- lines, start "jumping mode", and highlight all target matches.
-- Example usage:
-- - `fxff` - move *f*orward onto next character "x", then next, and next again
-- - `dt)` - *d*elete *t*ill next closing parenthesis (`)`)
later(function() require('mini.jump').setup() end)

-- vim: et sts=2 sw=2 ts=2
