-- ┌───────────┐
-- │ Mini.Move │
-- └───────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-move
--
-- Description:
-- Neovim Lua plugin to move any selection in any direction.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Move any selection in any direction.
-- Example usage in Normal mode:
-- - `<M-j>`/`<M-k>` - move current line down / up
-- - `<M-h>`/`<M-l>` - decrease / increase indent of current line
--
-- Example usage in Visual mode:
-- - `<M-h>`/`<M-j>`/`<M-k>`/`<M-l>` - move selection left/down/up/right
later(function() require('mini.move').setup() end)

-- vim: et sts=2 sw=2 ts=2
