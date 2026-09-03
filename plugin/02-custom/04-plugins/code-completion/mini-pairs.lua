-- ┌────────────┐
-- │ Mini.Pairs │
-- └────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-pairs
--
-- Description:
-- Neovim Lua plugin to automatically manage character pairs.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Autopairs functionality.
-- Insert pair when typing opening character and go over right character if it
-- is already to cursor's right.
-- Also provides mappings for `<CR>` and `<BS>` to perform extra actions when
-- inside pair.
-- Example usage in Insert mode:
-- - `(` - insert "()" and put cursor between them
-- - `)` when there is ")" to the right - jump over ")" without inserting new one
-- - `<C-v>(` - always insert a single "(" literally.
-- This is useful since `mini.pairs` doesn't provide particularly smart
-- behavior, like auto balancing.
later(function()
  -- Create pairs not only in Insert, but also in Command line mode
  require('mini.pairs').setup({ modes = { command = true } })
end)

-- vim: et sts=2 sw=2 ts=2
