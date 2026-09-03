-- ┌──────────────┐
-- │ Mini.Starter │
-- └──────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-starter
--
-- Description:
-- Neovim Lua plugin with fast and flexible start screen.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local now = Config.now

-- Start screen.
-- This is what is shown when you open Neovim like `nvim`.
-- Example usage:
-- - Type prefix keys to limit available candidates
-- - Navigate down/up with `<C-n>` and `<C-p>`
-- - Press `<CR>` to select an entry
--
-- See also:
-- - `:h MiniStarter-example-config` - non-default config examples
-- - `:h MiniStarter-lifecycle` - how to work with Starter buffer
now(function() require('mini.starter').setup() end)

-- vim: et sts=2 sw=2 ts=2
