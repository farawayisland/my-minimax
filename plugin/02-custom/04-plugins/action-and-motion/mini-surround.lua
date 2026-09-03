-- ┌───────────────┐
-- │ Mini.Surround │
-- └───────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-surround
--
-- Description:
-- Neovim Lua plugin with fast and feature-rich surround actions.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Surround actions: add/delete/replace/find/highlight.
-- Working with surroundings is surprisingly common: surround word with quotes,
-- replace `)` with `]`, etc.
-- This module comes with many built-in surroundings, each identified by a single
-- character.
-- It searches only for surrounding that covers cursor and comes with a special
-- "next" / "last" versions of actions to search forward or backward
-- (just like `mini.ai`).
-- All text editing actions are dot-repeatable (see `:h .`).
--
-- Example usage (this may feel intimidating at first, but after practice it
-- becomes second nature during text editing):
-- - `saiw)` - *s*urround *a*dd for *i*nside *w*ord parenthesis (`)`)
-- - `sdf`   - *s*urround *d*elete *f*unction call (like `f(var)` -> `var`)
-- - `srb[`  - *s*urround *r*eplace *b*racket (any of [], (), {}) with padded `[`
-- - `sf*`   - *s*urround *f*ind right part of `*` pair (like bold in markdown)
-- - `shf`   - *s*urround *h*ighlight current *f*unction call
-- - `srn{{` - *s*urround *r*eplace *n*ext curly bracket `{` with padded `{`
-- - `sdl'`  - *s*urround *d*elete *l*ast quote pair (`'`)
-- - `vaWsa<Space>` - *v*isually select *a*round *W*ORD and *s*urround *a*dd
--                    spaces (`<Space>`)
--
-- See also:
-- - `:h MiniSurround-builtin-surroundings` - list of all supported surroundings
-- - `:h MiniSurround-surrounding-specification` - examples of custom surroundings
-- - `:h MiniSurround-vim-surround-config` - alternative set of action mappings
later(function() require('mini.surround').setup() end)

-- vim: et sts=2 sw=2 ts=2
