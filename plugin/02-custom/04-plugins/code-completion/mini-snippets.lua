-- ┌───────────────┐
-- │ Mini.Snippets │
-- └───────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-snippets
--
-- Description:
-- Manage and expand snippets.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Manage and expand snippets (templates for a frequently used text).
-- Typical workflow is to type snippet's (configurable) prefix and expand it
-- into a snippet session.
--
-- How to manage snippets:
-- - `mini.snippets` itself doesn't come with preconfigured snippets.
--   Instead there
--   is a flexible system of how snippets are prepared before expanding.
--   They can come from pre-defined path on disk, `snippets/` directories inside
--   config or plugins, defined inside `setup()` call directly.
-- - This config, however, does come with snippet configuration:
--     - `snippets/global.json` is a file with global snippets that will be
--       available in any buffer
--     - `after/snippets/lua.json` defines personal snippets for Lua language
--     - `friendly-snippets` plugin configured in `plugin/40_plugins.lua` provides
--       a collection of language snippets
--
-- How to expand a snippet in Insert mode:
-- - If you know a snippet's prefix, type it as a word and press `<C-j>`.
--   The snippet's body should be inserted instead of the prefix.
-- - If you don't remember the snippet's prefix, type only part of it (or none at all)
--   and press `<C-j>`.
--   It should show picker with all snippets that have prefixes matching typed
--   characters (or all snippets if none was typed).
--   Choose one and its body should be inserted instead of previously typed text.
--
-- How to navigate during snippet session:
-- - Snippets can contain tabstops - places for user to interactively adjust text.
--   Each tabstop is highlighted depending on session progression - whether tabstop
--   is current, was or was not visited.
--   If tabstop doesn't yet have text, it is visualized with special "ghost"
--   inline text: • and ∎ by default.
-- - Type necessary text at current tabstop and navigate to next/previous one
--   by pressing `<C-l>` / `<C-h>`.
-- - Repeat previous step until you reach special final tabstop, usually denoted
--   by ∎ symbol.
--   If you spotted a mistake in an earlier tabstop, navigate to it and return
--   back to the final tabstop.
-- - To end a snippet session when at final tabstop, keep typing or go into
--   Normal mode.
--   To force end snippet session, press `<C-c>`.
--
-- See also:
-- - `:h MiniSnippets-overview` - overview of how module works
-- - `:h MiniSnippets-examples` - examples of common setups
-- - `:h MiniSnippets-session` - details about snippet session
-- - `:h MiniSnippets.gen_loader` - list of available loaders
later(function()
  -- Define language patterns to work better with `friendly-snippets`
  local latex_patterns = { 'latex/**/*.json', '**/latex.json' }
  local lang_patterns = {
    tex = latex_patterns,
    plaintex = latex_patterns,
    -- Recognize special injected language of markdown tree-sitter parser
    markdown_inline = { 'markdown.json' },
  }

  local config_path = vim.fn.stdpath('config')
  local snippets = require('mini.snippets')
  snippets.setup({
    snippets = {
      -- Always load `snippets/global.json` from config directory
      snippets.gen_loader.from_file(config_path .. '/snippets/global.json'),
      -- Load from `snippets/` directory of plugins, like `friendly-snippets`
      snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
    },
  })

  -- By default snippets available at cursor are not shown as candidates in
  -- `mini.completion` menu.
  -- This requires a dedicated in-process LSP server that will provide them.
  -- To have that, uncomment next line (use `gcc`).
  -- MiniSnippets.start_lsp_server()
end)

-- vim: et sts=2 sw=2 ts=2
