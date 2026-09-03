-- ┌─────────────────┐
-- │ Mini.Hipatterns │
-- └─────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-hipatterns
--
-- Description:
-- Highlight patterns in text.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local later = Config.later

-- Highlight patterns in text.
-- Like `TODO`/`NOTE` or color hex codes.
-- Example usage:
-- - `:Pick hipatterns` - pick among all highlighted patterns
--
-- See also:
-- - `:h MiniHipatterns-examples` - examples of common setups
later(function()
  local hipatterns = require('mini.hipatterns')
  local hi_words = MiniExtra.gen_highlighter.words
  hipatterns.setup({
    highlighters = {
      -- Highlight a fixed set of common words.
      -- Will be highlighted in any place, not like "only in comments".
      fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
      hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
      note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),
      todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),

      -- Highlight hex color string (#aabbcc) with that color as a background
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)

-- vim: et sts=2 sw=2 ts=2
