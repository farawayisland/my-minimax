-- ┌──────────────┐
-- │ Mini.Tabline │
-- └──────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-tabline
--
-- Description:
-- Neovim Lua plugin with minimal and fast tabline.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local now = Config.now

-- Tabline.
-- Sets `:h 'tabline'` to show all listed buffers in a line at the top.
-- Buffers are ordered as they were created.
-- Navigate with `[b` and `]b`.
now(function() require('mini.tabline').setup() end)

-- vim: et sts=2 sw=2 ts=2
