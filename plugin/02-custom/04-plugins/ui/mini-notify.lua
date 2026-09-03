-- ┌─────────────┐
-- │ Mini.Notify │
-- └─────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-notify
--
-- Description:
-- Show notifications.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local now = Config.now

-- Notifications provider.
-- Shows all kinds of notifications in the upper right
-- corner (by default).
-- Example usage:
-- - `:h vim.notify()` - show notification (hides automatically)
-- - `<Leader>en` - show notification history
--
-- See also:
-- - `:h MiniNotify.config` for some of common configuration examples.
now(function() require('mini.notify').setup() end)

-- vim: et sts=2 sw=2 ts=2
