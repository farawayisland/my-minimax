-- ┌──────────┐
-- │ Mini.Map │
-- └──────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-map
--
-- Description:
-- Neovim Lua plugin to manage window with buffer text overview.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Window with text overview.
-- It is displayed on the right hand side.
-- Can be used for quick overview and navigation.
-- Hidden by default.
-- Example usage:
-- - `<Leader>mt` - toggle map window
-- - `<Leader>mf` - focus on the map for fast navigation
-- - `<Leader>ms` - change map's side (if it covers something underneath)
--
-- See also:
-- - `:h MiniMap.gen_encode_symbols` - list of symbols to use for text encoding
-- - `:h MiniMap.gen_integration` - list of integrations to show in the map
--
-- NOTE: Might introduce lag on very big buffers (10000+ lines)
later(function()
  local map = require('mini.map')
  map.setup({
    -- Use Braille dots to encode text
    symbols = { encode = map.gen_encode_symbols.dot('4x2') },
    -- Show built-in search matches, `mini.diff` hunks, and diagnostic entries
    integrations = {
      map.gen_integration.builtin_search(),
      map.gen_integration.diff(),
      map.gen_integration.diagnostic(),
    },
  })

  -- Map built-in navigation characters to force map refresh
  for _, key in ipairs({ 'n', 'N', '*', '#' }) do
    local rhs = key
      -- Also open enough folds when jumping to the next match
      .. 'zv'
      .. '<Cmd>lua MiniMap.refresh({}, { lines = false, scrollbar = false })<CR>'
    vim.keymap.set('n', key, rhs)
  end
end)

-- vim: et sts=2 sw=2 ts=2
