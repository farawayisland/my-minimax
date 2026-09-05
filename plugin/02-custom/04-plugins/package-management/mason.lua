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
-- `mason-lspconfig.nvim`:  Extension to `mason.nvim` that makes it easier to
--                          use `nvim-lspconfig` with `mason.nvim`.

-- Make concise helpers for installing/adding plugins in two stages.
local add = vim.pack.add
local function gh(repo) return 'https://github.com/' .. repo end
local now = Config.now

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
now(function()
  add({ gh('mason-org/mason.nvim') })
  add({ gh('mason-org/mason-lspconfig.nvim') })
  add({ gh('WhoIsSethDaniel/mason-tool-installer.nvim') })

  require('mason').setup()
  require('mason-lspconfig').setup({ automatic_enable = false })

  local language_servers = require('custom.external-packages.language-servers')
  local formatters_and_linters =
    require('custom.external-packages.formatters-and-linters')
  local ensure_installed = vim.tbl_keys(language_servers or {})
  vim.list_extend(ensure_installed, formatters_and_linters)

  require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
end)

-- vim: et sts=2 sw=2 ts=2
