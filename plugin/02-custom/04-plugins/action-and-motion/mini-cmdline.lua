-- ┌──────────────┐
-- │ Mini.Cmdline │
-- └──────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-cmdline
--
-- Description:
-- Command line tweaks.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Command line tweaks.
-- Improves command line editing with:
-- - Autocompletion.
--   Basically an automated `:h cmdline-completion`.
-- - Autocorrection of words as-you-type.
--   Like `:W`->`:w`, `:lau`->`:lua`, etc.
-- - Autopeek command range (like line number at the start) as-you-type.
later(function() require('mini.cmdline').setup() end)

-- vim: et sts=2 sw=2 ts=2
