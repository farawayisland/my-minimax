-- ┌─────────────────────┐
-- │ MINI configurations │
-- └─────────────────────┘
--
-- This file contains configuration of the MINI parts of the config.
-- It contains only configs for the `mini.nvim` plugin (installed in
-- `init.lua`).
--
-- `mini.nvim` is a library of modules.
-- Each is enabled independently via
-- `require('mini.xxx').setup()` convention.
-- It creates all intended side effects:
-- mappings, autocommands, highlight groups, etc.
-- It also creates a global
-- `MiniXxx` table that can be later used to access module's features.
--
-- Every module's `setup()` function accepts an optional `config` table to
-- adjust its behavior.
-- See the structure of this table at `:h MiniXxx.config`.
--
-- See `:h mini.nvim-general-principles` for more general principles.
--
-- Here each module's `setup()` has a brief explanation of what the module is
-- for, its usage examples (uses Leader mappings from `plugin/20_keymaps.lua`),
-- and possible directions for more info.
-- For more info about a module see its help page (`:h mini.xxx` for
-- `mini.xxx`).

-- To minimize the time until first screen draw, modules are enabled in two
-- steps:
-- - Step one enables everything that is needed for first draw with `now()`.
--   Sometimes needed only if Neovim is started as `nvim -- path/to/file`.
-- - Everything else is delayed until the first draw with `later()`.
local now, now_if_args, later = Config.now, Config.now_if_args, Config.later
-- ─────────────────────────────────────────────────────────────────────────────
-- Step one
-- ─────────────────────────────────────────────────────────────────────────────
-- Enable `miniwinter` color scheme.
-- It comes with `mini.nvim` and uses `mini.hues`.
--
-- See also:
-- - `:h mini.nvim-color-schemes` - list of other color schemes
-- - `:h MiniHues-examples` - how to define highlighting with `mini.hues`
-- - `plugin/40_plugins.lua` honorable mentions - other good color schemes
now(function() vim.cmd('colorscheme miniwinter') end)

-- You can try these other `mini.hues`-based color schemes (uncomment with
-- `gcc`):
-- now(function() vim.cmd('colorscheme minispring') end)
-- now(function() vim.cmd('colorscheme minisummer') end)
-- now(function() vim.cmd('colorscheme miniautumn') end)
-- now(function() vim.cmd('colorscheme randomhue') end)

-- Common configuration presets.
-- Example usage:
-- - `<C-s>` in Insert mode - save and go to Normal mode
-- - `go` / `gO` - insert empty line before/after in Normal mode
-- - `gy` / `gp` - copy / paste from system clipboard
-- - `\` + key - toggle common options.
--               Like `\h` toggles highlighting search.
-- - `<C-hjkl>` (four combos) - navigate between windows.
-- - `<M-hjkl>` in Insert/Command-line mode - navigate in that mode.
--
-- See also:
-- - `:h MiniBasics.config.options` - list of adjusted options
-- - `:h MiniBasics.config.mappings` - list of created mappings
-- - `:h MiniBasics.config.autocommands` - list of created autocommands
now(function()
  require('mini.basics').setup({
    -- Manage options in `plugin/10_options.lua` for didactic purposes
    options = { basic = false },
    mappings = {
      -- Create `<C-hjkl>` mappings for window navigation
      windows = true,
      -- Create `<M-hjkl>` mappings for navigation in Insert and Command-line modes
      move_with_alt = true,
    },
  })
end)

-- ─────────────────────────────────────────────────────────────────────────────
-- Step one or two
-- ─────────────────────────────────────────────────────────────────────────────
-- Load now if Neovim is started like `nvim -- path/to/file`, otherwise - later.
-- This ensures a correct behavior for files opened during startup.

-- Miscellaneous small but useful functions.
-- Example usage:
-- - `<Leader>oz` - toggle between "zoomed" and regular view of current buffer
-- - `<Leader>or` - resize window to its "editable width"
-- - `:lua put_text(vim.lsp.get_clients())` - put output of a function below
--   cursor in current buffer.
--   Useful for a detailed exploration.
-- - `:lua put(MiniMisc.stat_summary(MiniMisc.bench_time(f, 100)))` - run
--   function `f` 100 times and report statistical summary of execution times
now_if_args(function()
  -- Makes `:h MiniMisc.put()` and `:h MiniMisc.put_text()` public
  require('mini.misc').setup()

  -- Change current working directory based on the current file path.
  -- It searches up the file tree until the first root marker (`.git` or
  -- `Makefile`)
  -- and sets their parent directory as a current directory.
  -- This is helpful when simultaneously dealing with files from several projects.
  MiniMisc.setup_auto_root()

  -- Restore latest cursor position on file open
  MiniMisc.setup_restore_cursor()

  -- Synchronize terminal emulator background with Neovim's background to remove
  -- possibly different color padding around Neovim instance
  MiniMisc.setup_termbg_sync()
end)
-- ─────────────────────────────────────────────────────────────────────────────
-- Step two
-- ─────────────────────────────────────────────────────────────────────────────
-- Extra `mini.nvim` functionality.
--
-- See also:
-- - `:h MiniExtra.pickers` - pickers.
--   Most are mapped in `<Leader>f` group.
--   Calling `setup()` makes `mini.pick` respect `mini.extra` pickers.
-- - `:h MiniExtra.gen_ai_spec` - `mini.ai` textobject specifications
-- - `:h MiniExtra.gen_highlighter` - `mini.hipatterns` highlighters
later(function() require('mini.extra').setup() end)

-- Animate common Neovim actions.
-- Like cursor movement, scroll, window resize, window open, window close.
-- Animations are done based on Neovim events and don't require custom mappings.
--
-- It is not enabled by default because its effects are a matter of taste.
-- Also scroll and resize have some unwanted side effects (see `:h
-- mini.animate`).
-- Uncomment next line (use `gcc`) to enable.
-- later(function() require('mini.animate').setup() end)

-- Tweak and save any color scheme.
-- Contains utility functions to work with
-- color spaces and color schemes.
-- Example usage:
-- - `:Colorscheme default` - switch with animation to the default color scheme
--
-- See also:
-- - `:h MiniColors.interactive()` - interactively tweak color scheme
-- - `:h MiniColors-recipes` - common recipes to use during interactive tweaking
-- - `:h MiniColors.convert()` - convert between color spaces
-- - `:h MiniColors-color-spaces` - list of supported color spaces
--
-- It is not enabled by default because it is not really needed on a daily basis.
-- Uncomment next line (use `gcc`) to enable.
-- later(function() require('mini.colors').setup() end)

-- Autohighlight word under cursor with a customizable delay.
-- Word boundaries are defined based on `:h 'iskeyword'` option.
--
-- It is not enabled by default because its effects are a matter of taste.
-- Uncomment next line (use `gcc`) to enable.
-- later(function() require('mini.cursorword').setup() end)

-- Not mentioned here, but can be useful:
-- - `mini.doc` - needed only for plugin developers.
-- - `mini.fuzzy` - not really needed on a daily basis.
-- - `mini.test` - needed only for plugin developers.

-- vim: et sts=2 sw=2 ts=2
