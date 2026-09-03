-- ┌─────────┐
-- │ Conform │
-- └─────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://github.com/catppuccin/nvim
--
-- Description:
-- Lightweight yet powerful formatter plugin for Neovim.

-- Make concise helpers for installing/adding plugins in two stages.
local add = vim.pack.add
local function gh(repo) return 'https://github.com/' .. repo end
local later = Config.later

-- Programs dedicated to text formatting (a.k.a. formatters) are very useful.
-- Neovim has built-in tools for text formatting (see `:h gq` and `:h
-- 'formatprg'`).
-- They can be used to configure external programs, but it might become tedious.
--
-- The `stevearc/conform.nvim` plugin is a good and maintained solution for
-- easier formatting setup.
later(function()
  add({ gh('stevearc/conform.nvim') })

  -- See also:
  -- - `:h Conform`,
  -- - `:h conform-options`.
  -- - `:h conform-formatters`.
  require('conform').setup({
    default_format_opts = {
      -- Allow formatting from LSP server if no dedicated formatter is available.
      lsp_format = 'fallback',
    },
    -- Map of filetype to formatters.
    -- Make sure that necessary CLI tool is available.
    -- formatters_by_ft = { lua = { 'stylua' } },
  })
end)

-- vim: et sts=2 sw=2 ts=2
