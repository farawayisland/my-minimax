-- ┌────────────┐
-- │ Catppuccin │
-- └────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://github.com/catppuccin/nvim
--
-- Description:
-- Soothing pastel theme for Neovim.

-- Make concise helpers for installing/adding plugins in two stages.
local add = vim.pack.add
local function gh(repo) return 'https://github.com/' .. repo end
local now = Config.now

-- Install then enable `catppuccin-mocha` colorscheme.
now(function()
  add({ gh('catppuccin/nvim') })

  vim.cmd('color catppuccin')
end)

-- vim: et sts=2 sw=2 ts=2
