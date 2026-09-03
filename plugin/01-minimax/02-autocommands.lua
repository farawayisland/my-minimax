-- ┌──────────────────────────────────────────────────┐
-- │ Built-in Neovim behavior (Part II: Autocommands) │
-- └──────────────────────────────────────────────────┘
--
-- This file defines Neovim's built-in autocommands.
-- ─────────────────────────────────────────────────────────────────────────────
-- Autocommands
-- ─────────────────────────────────────────────────────────────────────────────
-- Don't auto-wrap comments and don't insert comment leader after hitting `o`.
-- Do on `FileType` to always override these changes from filetype plugins.
local f = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o') end
Config.new_autocmd('FileType', nil, f, "Proper 'formatoptions'")

-- There are other autocommands created by `mini.basics`.
-- See `plugin/30_mini.lua`.

-- vim: et sts=2 sw=2 ts=2
