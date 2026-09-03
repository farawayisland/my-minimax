-- ┌───────────────┐
-- │ Mini.Sessions │
-- └───────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-sessions
--
-- Description:
-- Neovim Lua plugin for session management.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local now = Config.now

-- Session management.
-- A thin wrapper around `:h mksession` that consistently
-- manages session files.
-- Example usage:
-- - `<Leader>sn` - start new session
-- - `<Leader>sr` - read previously started session
-- - `<Leader>sd` - delete previously started session
now(function() require('mini.sessions').setup() end)

-- vim: et sts=2 sw=2 ts=2
