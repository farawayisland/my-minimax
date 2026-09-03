-- ┌────────────┐
-- │ Mini.Input │
-- └────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-input
--
-- Description:
-- Get user input.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Customizable user input.
-- Improves how Neovim and plugins ask for input.
-- By default shows a floating window with the input prompt as title.
-- Window position depends on the input scope: at cursor, window or editor
-- bottom left.
--
-- When asked for input:
-- - Type it.
--   NOTE: this is not a regular Insert mode, but rather a customizable
--   and comprehensive Command-line mode emulation (it allows returning a value).
-- - Press `<Tab>` to show completion, `<C-p>` - previous history entry.
-- - Press `<CR>` to accept or `<Esc>` to cancel.
--
-- Example usage (usually works together with other plugins and modules):
-- - `saiwf` and type a function name to wrap a word with `mini.surround`
-- - `<Leader>lr` and type a new value to use with LSP rename
-- - `<Leader>fg` + `<C-o>` and type a custom filter glob for `grep_live` picker
-- - `:h vim.ui.input()` - implemented with `mini.input`.
--   Like after typing `<Leader>sn` to create a session asks for its name.
--
-- See also:
-- - `:h MiniInput.default_key()` - default special keys available when typing
-- - `:h MiniInput-examples` - general customization examples
-- - `:h MiniInput.gen_view` - bundled view customizations (adjust how floating
--   window is shown or use statusline/tabline/winbar/virtual text)
-- - `:h MiniInput-lifecycle` - details about how a custom mode emulation works
later(function() require('mini.input').setup() end)

-- vim: et sts=2 sw=2 ts=2
