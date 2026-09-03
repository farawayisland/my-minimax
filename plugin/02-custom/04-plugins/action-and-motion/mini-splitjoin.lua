-- ┌────────────────┐
-- │ Mini.Splitjoin │
-- └────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-splitjoin
--
-- Description:
-- Neovim Lua plugin to split and join arguments.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Split and join arguments (regions inside brackets between allowed separators).
-- It uses Lua patterns to find arguments, which means it works in comments and
-- strings but can be not as accurate as tree-sitter based solutions.
-- Each action can be configured with hooks (like add/remove trailing comma).
-- Example usage:
-- - `gS` - toggle between joined (all in one line) and split (each on a separate
--   line and indented) arguments.
--   It is dot-repeatable (see `:h .`).
--
-- See also:
-- - `:h MiniSplitjoin.gen_hook` - list of available hooks
later(function() require('mini.splitjoin').setup() end)

-- vim: et sts=2 sw=2 ts=2
