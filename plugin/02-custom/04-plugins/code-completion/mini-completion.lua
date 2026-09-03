-- ┌─────────────────┐
-- │ Mini.Completion │
-- └─────────────────┘
--
-- This file contains installation and configuration of the Neovim plugin
--
-- https://nvim-mini.org/mini.nvim/readmes/mini-completion
--
-- Description:
-- Neovim Lua plugin for completion and signature help.
-- Part of `mini.nvim` library.

-- Make concise helper for installing/adding plugins in two stages.
local now_if_args = Config.now_if_args

-- Completion and signature help.
-- Implements async "two stage" autocompletion:
-- - Based on attached LSP servers that support completion.
-- - Fallback (based on built-in keyword completion) if there is no LSP
--   candidates.
--
-- Example usage in Insert mode with attached LSP:
-- - Start typing text that should be recognized by LSP (like variable name).
-- - After 100ms a popup menu with candidates appears.
-- - Press `<Tab>` / `<S-Tab>` to navigate down/up the list.
--   These are set up in `mini.keymap`.
--   You can also use `<C-n>` / `<C-p>`.
-- - During navigation there is an info window to the right showing extra info
--   that the LSP server can provide about the candidate.
--   It appears after the candidate stays selected for 100ms.
--   Use `<C-f>` / `<C-b>` to scroll it.
-- - Navigating to an entry also changes buffer text.
--   If you are happy with it, keep typing after it.
--   To discard completion completely, press `<C-e>`.
-- - After pressing special trigger(s), usually `(`, a window appears that shows
--   the signature of the current function/method.
--   It gets updated as you type showing the currently active parameter.
--
-- Example usage in Insert mode without an attached LSP or in places not
-- supported by the LSP (like comments):
-- - Start typing a word that is present in current or opened buffers.
-- - After 100ms popup menu with candidates appears.
-- - Navigate with `<Tab>` / `<S-Tab>` or `<C-n>` / `<C-p>`.
--   This also updates buffer text.
--   If happy with choice, keep typing.
--   Stop with `<C-e>`.
--
-- It also works with snippet candidates provided by LSP server.
-- Best experience when paired with `mini.snippets` (which is set up in this file).
now_if_args(function()
  -- Customize post-processing of LSP responses for a better user experience.
  -- Don't show `Text` suggestions (usually noisy) and show snippets last.
  local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
  local process_items = function(items, base)
    return MiniCompletion.default_process_items(items, base, process_items_opts)
  end
  require('mini.completion').setup({
    lsp_completion = {
      -- Without this config autocompletion is set up through `:h 'completefunc'`.
      -- Although not needed, setting up through `:h 'omnifunc'` is cleaner
      -- (sets up only when needed) and makes it possible to use `<C-u>`.
      source_func = 'omnifunc',
      auto_setup = false,
      process_items = process_items,
    },
  })

  -- Set `omnifunc` for LSP completion only when needed.
  local on_attach = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end
  Config.new_autocmd('LspAttach', nil, on_attach, "Set 'omnifunc'")

  -- Advertise to servers that Neovim now supports certain set of completion and
  -- signature features through `mini.completion`.
  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
end)

-- vim: et sts=2 sw=2 ts=2
