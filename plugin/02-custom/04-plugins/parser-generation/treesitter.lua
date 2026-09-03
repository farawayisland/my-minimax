-- ┌─────────────┐
-- │ Tree-sitter │
-- └─────────────┘
--
-- This file contains installation and configuration of the Neovim plugins
--
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--
-- Description:
-- Nvim Treesitter configurations and abstraction layer.

-- Make concise helpers for installing/adding plugins in two stages.
local add = vim.pack.add
local function gh(repo) return 'https://github.com/' .. repo end
local now_if_args = Config.now_if_args

-- Tree-sitter is a tool for fast incremental parsing.
-- It converts text into a hierarchical structure (called tree) that can be used
-- to implement advanced and/or more precise actions: syntax highlighting,
-- textobjects, indent, etc.
--
-- Tree-sitter support is built into Neovim (see `:h treesitter`).
-- However, it requires two extra pieces that don't come with Neovim directly:
-- - Language parsers: programs that convert text into trees.
--   Some are built-in (like for Lua), `nvim-treesitter` provides many others.
--   NOTE: It requires third party software to build and install parsers.
--   See the link for more info in "Requirements" section of the MiniMax README.
--
-- - Query files: definitions of how to extract information from trees in
--   a useful manner (see `:h treesitter-query`).
--   `nvim-treesitter` also provides these, while `nvim-treesitter-textobjects`
--   provides the ones for Neovim textobjects (see `:h text-objects`,
--   `:h MiniAi.gen_spec.treesitter()`).
--
-- Add these plugins now if file (and not `mini.starter`) is shown after
-- startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.treesitter nvim-treesitter` to see potential issues.
-- - In case of errors related to queries for Neovim bundled parsers (like
--   `lua`, `vimdoc`, `markdown`, etc.), manually install them via
--   `nvim-treesitter` with `:TSInstall <language>`.
--   Be sure to have necessary system dependencies (see MiniMax README section
--   for software requirements).
now_if_args(function()
  -- Define hook to update tree-sitter parsers after plugin is updated
  local ts_update = function() vim.cmd('TSUpdate') end
  Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

  add({
    gh('nvim-treesitter/nvim-treesitter'),
    gh('nvim-treesitter/nvim-treesitter-textobjects'),
  })

  -- Define languages which will have parsers installed and auto enabled.
  -- After changing this, restart Neovim once to install necessary parsers.
  -- Wait for the installation to finish before opening a file for added.
  -- language(s).
  local languages = {
    -- These are already pre-installed with Neovim.
    -- Used as an example.
    'lua',
    'vimdoc',
    'markdown',
    -- Add here more languages with which you want to use tree-sitter.
    -- To see available languages:
    -- - Execute `:=require('nvim-treesitter').get_available()`.
    -- - Visit `SUPPORTED_LANGUAGES.md` file at
    --   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language.
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- vim: et sts=2 sw=2 ts=2
