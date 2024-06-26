local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function has_value(tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

local exclude_format_on_save = { "markdown" }
local lsp_formatting = function(bufnr)
  if (not has_value(exclude_format_on_save, vim.bo.filetype)) then
    vim.lsp.buf.format({
      filter = function(client)
        return client.name == "null-ls"
      end,
      bufnr = bufnr,
    })
  end
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.zsh
  },
  on_attach = function(client, bufnr)
    -- Manual formatting
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '', {
      noremap = true,
      silent = true,
      callback = function()
        lsp_formatting(bufnr)
      end
    })

    --   -- Auto-formatting
    --   if client.supports_method("textDocument/formatting") then
    --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --       group = augroup,
    --       buffer = bufnr,
    --       callback = function()
    --         lsp_formatting(bufnr)
    --       end,
    --     })
    --   end
  end
})

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
