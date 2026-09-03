-- ┌─────────────┐
-- │ Mini.Visits │
-- └─────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-visits
--
-- Description:
-- Track and reuse file system visits.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Track and reuse file system visits.
-- Every file/directory visit is persistently tracked on disk to later reuse:
-- show in special frecency order, etc.
-- It also supports adding labels to visited paths to quickly navigate between
-- them.
-- Example usage:
-- - `<Leader>fv` - find across all visits
-- - `<Leader>vv` / `<Leader>vV` - add/remove special "core" label to current file
-- - `<Leader>vc` / `<Leader>vC` - show files with "core" label; all or added within
--   current working directory
--
-- See also:
-- - `:h MiniVisits-overview` - overview of how module works
-- - `:h MiniVisits-examples` - examples of common setups
later(function() require('mini.visits').setup() end)

-- vim: et sts=2 sw=2 ts=2
