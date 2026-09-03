-- ┌───────────┐
-- │ Mini.Diff │
-- └───────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-diff
--
-- Description:
-- Work with diff hunks.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Work with diff hunks that represent the difference between the buffer text and
-- some reference text set by a source.
-- Default source uses text from Git index.
-- Also provides summary info used in developer section of `mini.statusline`.
-- Example usage:
-- - `ghip` - apply hunks (`gh`) within *i*nside *p*aragraph
-- - `gHG` - reset hunks (`gH`) from cursor until end of buffer (`G`)
-- - `ghgh` - apply (`gh`) hunk at cursor (`gh`)
-- - `gHgh` - reset (`gH`) hunk at cursor (`gh`)
-- - `<Leader>go` - toggle overlay
--
-- See also:
-- - `:h MiniDiff-overview` - overview of how module works
-- - `:h MiniDiff-diff-summary` - available summary information
-- - `:h MiniDiff.gen_source` - available built-in sources
later(function() require('mini.diff').setup() end)

-- vim: et sts=2 sw=2 ts=2
