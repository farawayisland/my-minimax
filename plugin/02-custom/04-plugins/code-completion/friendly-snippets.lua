-- ┌───────────────────┐
-- │ Friendly.Snippets │
-- └───────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://github.com/rafamadriz/friendly-snippets
--
-- Description:
-- Manage and expand snippets.
-- Part of `mini.nvim` library.

-- Make concise helpers for installing/adding plugins in two stages.
local add = vim.pack.add
local function gh(repo) return 'https://github.com/' .. repo end
local later = Config.later

-- Although `mini.snippets` provides functionality to manage snippet files, it
-- deliberately doesn't come with those.
--
-- The `rafamadriz/friendly-snippets` is currently the largest collection of
-- snippet files.
-- They are organized in `snippets/` directory (mostly) per language.
-- `mini.snippets` is designed to work with it as seamlessly as possible.
-- See `:h MiniSnippets.gen_loader.from_lang()`.
later(function() add({ gh('rafamadriz/friendly-snippets') }) end)

-- vim: et sts=2 sw=2 ts=2
