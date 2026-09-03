-- ┌─────────────┐
-- │ Mini.Keymap │
-- └─────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-keymap
--
-- Description:
-- Special key mappings.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Special key mappings.
-- Provides helpers to map:
-- - Multi-step actions.
--   Apply action 1 if condition is met; else apply action 2 if condition is
--   met; etc.
-- - Combos.
--   Sequence of keys where each acts immediately plus execute extra action if
--   all are typed fast enough.
--   Useful for Insert mode mappings to not introduce delay when typing mapping
--   keys without intention to execute action.
--
-- See also:
-- - `:h MiniKeymap-examples` - examples of common setups
-- - `:h MiniKeymap.map_multistep()` - map multi-step action
-- - `:h MiniKeymap.map_combo()` - map combo
later(function()
  require('mini.keymap').setup()
  -- Navigate `mini.completion` menu with `<Tab>` /  `<S-Tab>`
  MiniKeymap.map_multistep('i', '<Tab>', { 'pmenu_next' })
  MiniKeymap.map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
  -- On `<CR>` try to accept current completion item, fall back to accounting
  -- for pairs from `mini.pairs`
  MiniKeymap.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  -- On `<BS>` just try to account for pairs from `mini.pairs`
  MiniKeymap.map_multistep('i', '<BS>', { 'minipairs_bs' })
end)

-- vim: et sts=2 sw=2 ts=2
