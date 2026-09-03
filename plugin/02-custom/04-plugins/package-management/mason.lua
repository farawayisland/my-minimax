-- ┌───────┐
-- │ Mason │
-- └───────┘
--
-- This file contains installation and configuration of the Neovim plugins
--
-- https://github.com/mason-org/mason.nvim
-- https://github.com/mason-org/mason-lspconfig.nvim
--
-- Descriptions:
-- `mason.nvim`          :  Portable package manager for Neovim that runs
--                          everywhere Neovim runs.
--                          Easily install and manage LSP servers, DAP servers,
--                          linters, and formatters.
-- `mason-lspconfig.nvim`:  Extension to `mason.nvim` that makes it easier to
--                          use `nvim-lspconfig` with `mason.nvim`.

-- Make concise helpers for installing/adding plugins in two stages.
local add = vim.pack.add
local function gh(repo) return 'https://github.com/' .. repo end
local now_if_args = Config.now_if_args

-- `mason-org/mason.nvim` (a.k.a. "Mason") is a great tool (package manager) for
-- installing external language servers, formatters, and linters.
-- It provides a unified interface for installing, updating, and deleting such
-- programs.
--
-- The caveat is that these programs will be set up to be mostly used inside
-- Neovim.
-- If you need them to work elsewhere, consider using other package managers.
--
-- You can use it like so:
now_if_args(function()
  add({ gh('mason-org/mason.nvim') })
  require('mason').setup()
end)

-- vim: et sts=2 sw=2 ts=2
