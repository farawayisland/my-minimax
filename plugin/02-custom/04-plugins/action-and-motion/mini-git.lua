-- ┌──────────┐
-- │ Mini.Git │
-- └──────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-git
--
-- Description:
-- Git integration.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Git integration for more straightforward Git actions based on Neovim's state.
-- It is not meant as a fully featured Git client, only to provide helpers that
-- integrate better with Neovim.
-- Example usage:
-- - `<Leader>gs` - show information at cursor
-- - `<Leader>gd` - show unstaged changes as a patch in separate tabpage
-- - `<Leader>gL` - show Git log of current file
-- - `:Git help git` - show output of `git help git` inside Neovim
--
-- See also:
-- - `:h MiniGit-examples` - examples of common setups
-- - `:h :Git` - more details about `:Git` user command
-- - `:h MiniGit.show_at_cursor()` - what information at cursor is shown
later(function() require('mini.git').setup() end)

-- vim: et sts=2 sw=2 ts=2
