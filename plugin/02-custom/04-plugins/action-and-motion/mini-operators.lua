-- ┌────────────────┐
-- │ Mini.Operators │
-- └────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-operators
--
-- Description:
-- Text edit operators.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Text edit operators.
-- All operators have mappings for:
-- - Regular operator (waits for motion/textobject to use)
-- - Current line action (repeat second character of operator to activate)
-- - Act on visual selection (type operator in Visual mode)
--
-- Example usage:
-- - `griw` - replace (`gr`) *i*inside *w*ord
-- - `gmm` - multiple/duplicate (`gm`) current line (extra `m`)
-- - `vipgs` - *v*isually select *i*nside *p*aragraph and sort it (`gs`)
-- - `gxiww.` - exchange (`gx`) *i*nside *w*ord with next word (`w` to navigate
--   to it and `.` to repeat exchange operator)
-- - `g==` - execute current line as Lua code and replace with its output.
--   For example, typing `g==` over line `vim.lsp.get_clients()` shows
--   information about all available LSP clients.
--
-- See also:
-- - `:h MiniOperators-mappings` - overview of how mappings are created
-- - `:h MiniOperators-overview` - overview of present operators
later(function()
  require('mini.operators').setup()

  -- Create mappings for swapping adjacent arguments.
  -- NOTE:
  -- - Relies on `a` argument textobject from `mini.ai`.
  -- - It is not 100% reliable, but mostly works.
  -- - It overrides `:h (` and `:h )`.
  -- Explanation: `gx`-`ia`-`gx`-`ila` <=> exchange current and last argument
  -- Usage: when on `a` in `(aa, bb)` press `)` followed by `(`.
  vim.keymap.set(
    'n',
    '(',
    'gxiagxila',
    { remap = true, desc = 'Swap arg left' }
  )
  vim.keymap.set(
    'n',
    ')',
    'gxiagxina',
    { remap = true, desc = 'Swap arg right' }
  )
end)

-- vim: et sts=2 sw=2 ts=2
