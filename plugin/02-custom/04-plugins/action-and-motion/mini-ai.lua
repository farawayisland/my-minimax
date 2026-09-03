-- ┌─────────┐
-- │ Mini.Ai │
-- └─────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-ai
--
-- Description:
-- Neovim Lua plugin to extend and create `a`/`i` textobjects.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Extend and create a/i textobjects, like `:h a(`, `:h a'`, and more).
-- Contains not only `a` and `i` type of textobjects, but also their "next" and
-- "last" variants that will explicitly search for textobjects after and before
-- cursor.
-- Example usage:
-- - `ci)` - *c*hange *i*inside parenthesis (`)`)
-- - `di(` - *d*elete *i*inside padded parenthesis (`(`)
-- - `yaq` - *y*ank *a*round *q*uote (any of "", '', or ``)
-- - `vif` - *v*isually select *i*inside *f*unction call
-- - `cina` - *c*hange *i*nside *n*ext *a*rgument
-- - `valaala` - *v*isually select *a*round *l*ast (i.e. previous) *a*rgument
--   and then again reselect *a*round new *l*ast *a*rgument
--
-- See also:
-- - `:h text-objects` - general info about what textobjects are
-- - `:h MiniAi-builtin-textobjects` - list of all supported textobjects
-- - `:h MiniAi-textobject-specification` - examples of custom textobjects
later(function()
  local ai = require('mini.ai')
  ai.setup({
    -- `mini.ai` can be extended with custom textobjects
    custom_textobjects = {
      -- Make `aB` / `iB` act on around/inside whole *b*uffer
      B = MiniExtra.gen_ai_spec.buffer(),
      -- For more complicated textobjects that require structural awareness,
      -- use tree-sitter.
      -- This example makes `aF`/`iF` mean around/inside function
      -- definition (not call).
      -- See `:h MiniAi.gen_spec.treesitter()` for details.
      F = ai.gen_spec.treesitter({
        a = '@function.outer',
        i = '@function.inner',
      }),
    },

    -- `mini.ai` by default mostly mimics built-in search behavior: first try
    -- to find textobject covering cursor, then try to find to the right.
    -- Although this works in most cases, some are confusing.
    -- It is more robust to always try to search only covering textobject and
    -- explicitly ask to search for next (`an`/`in`) or last (`al`/`il`).
    -- Try this.
    -- If you don't like it - delete next line and this comment.
    search_method = 'cover',
  })
end)

-- vim: et sts=2 sw=2 ts=2
