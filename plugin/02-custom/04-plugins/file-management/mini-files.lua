-- ┌────────────┐
-- │ Mini.Files │
-- └────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-files
--
-- Description:
-- Navigate and manipulate file system.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local now_if_args = Config.now_if_args

-- Navigate and manipulate file system
--
-- Navigation is done using column view (Miller columns) to display nested
-- directories, they are displayed in floating windows in top left corner.
--
-- Manipulate files and directories by editing text as regular buffers.
--
-- Example usage:
-- - `<Leader>ed` - open current working directory
-- - `<Leader>ef` - open directory of current file (needs to be present on disk)
--
-- Basic navigation:
-- - `l` - go in entry at cursor: navigate into directory or open file
-- - `h` - go out of focused directory
-- - Navigate window as any regular buffer
-- - Press `g?` inside explorer to see more mappings
--
-- Basic manipulation:
-- - After any following action, press `=` in Normal mode to synchronize, read
--   carefully about actions, press `y` or `<CR>` to confirm
-- - New entry: press `o` and type its name; end with `/` to create directory
-- - Rename: press `C` and type new name
-- - Delete: type `dd`
-- - Move/copy: type `dd`/`yy`, navigate to target directory, press `p`
--
-- See also:
-- - `:h MiniFiles-navigation` - more details about how to navigate
-- - `:h MiniFiles-manipulation` - more details about how to manipulate
-- - `:h MiniFiles-examples` - examples of common setups
now_if_args(function()
  -- Enable directory/file preview
  require('mini.files').setup({ windows = { preview = true } })

  -- Add common bookmarks for every explorer.
  -- Example usage inside explorer:
  -- - `'c` to navigate into your config directory
  -- - `g?` to see available bookmarks
  local add_marks = function()
    MiniFiles.set_bookmark('c', vim.fn.stdpath('config'), { desc = 'Config' })
    local vimpack_plugins = vim.fn.stdpath('data') .. '/site/pack/core/opt'
    MiniFiles.set_bookmark('p', vimpack_plugins, { desc = 'Plugins' })
    MiniFiles.set_bookmark('w', vim.fn.getcwd, { desc = 'Working directory' })
  end
  Config.new_autocmd(
    'User',
    'MiniFilesExplorerOpen',
    add_marks,
    'Add bookmarks'
  )
end)

-- vim: et sts=2 sw=2 ts=2
