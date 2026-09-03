-- ┌─────────────┐
-- │ Mini.Jump2d │
-- └─────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-jump2d
--
-- Description:
-- Neovim Lua plugin to jump within visible lines.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Jump within visible lines to pre-defined spots via iterative label filtering.
-- Spots are computed by a configurable spotter function.
-- Example usage:
-- - Lock eyes on desired location to jump
-- - `<CR>` - start jumping; this shows character labels over target spots
-- - Type character that appears over desired location; number of target spots
--   should be reduced
-- - Keep typing labels until target spot is unique to perform the jump
--
-- See also:
-- - `:h MiniJump2d.gen_spotter` - list of available spotters
later(function() require('mini.jump2d').setup() end)

-- vim: et sts=2 sw=2 ts=2
