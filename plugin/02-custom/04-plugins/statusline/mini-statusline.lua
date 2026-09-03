-- ┌─────────────────┐
-- │ Mini.Statusline │
-- └─────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-statusline
--
-- Description:
-- Neovim Lua plugin with minimal and fast statusline.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local now = Config.now

-- Statusline.
-- Sets `:h 'statusline'` to show more info in a line below window.
-- Example usage:
-- - Left most section indicates current mode (text + highlighting).
-- - Second from left section shows "developer info": Git, diff, diagnostics, LSP.
-- - Center section shows the name of displayed buffer.
-- - Second to right section shows more buffer info.
-- - Right most section shows current cursor coordinates and search results.
--
-- See also:
-- - `:h MiniStatusline-example-content` - example of default content.
-- Use it to configure a custom statusline by setting `config.content.active`
-- function.
now(function() require('mini.statusline').setup() end)

-- vim: et sts=2 sw=2 ts=2
