-- ┌────────────┐
-- │ LSP Config │
-- └────────────┘
--
-- This file contains installation and configuration of the Neovim plugins
--
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/mason-org/mason.nvim
-- https://github.com/mason-org/mason-lspconfig.nvim
--
-- Description:
-- Quickstart configs for Nvim LSP.

-- Make concise helpers for installing/adding plugins in two stages.
local add = vim.pack.add
local function gh(repo) return 'https://github.com/' .. repo end
local now_if_args = Config.now_if_args

-- Language Server Protocol (LSP) is a set of conventions that power creation of
-- language specific tools.
-- It requires two parts:
-- - Server - program that performs language specific computations.
-- - Client - program that asks server for computations and shows results.
--
-- Here Neovim itself is a client (see `:h vim.lsp`).
-- Language servers need to be installed separately based on your OS, CLI tools,
-- and preferences.
-- See note about `mason.nvim` at the bottom of the file.
--
-- Neovim's team collects commonly used configurations for most language servers
-- inside `neovim/nvim-lspconfig` plugin.
--
-- Add it now if file (and not `mini.starter`) is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.lsp` to see potential issues.
now_if_args(function()
  add({ gh('neovim/nvim-lspconfig') })

  -- Use `:h vim.lsp.enable()` to automatically enable language server based on
  -- the rules provided by `nvim-lspconfig`.
  -- Use `:h vim.lsp.config()` or `after/lsp/` directory to configure servers.
  -- Uncomment and tweak the following `vim.lsp.enable()` call to enable
  -- servers.

  local language_servers = require('custom.external-packages.language-servers')
  for name, config in pairs(language_servers) do
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
  end
end)

-- vim: et sts=2 sw=2 ts=2
