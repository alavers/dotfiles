vim.g['ackprg'] = 'ag --path-to-ignore ~/.ignore --vimgrep'

vim.api.nvim_create_user_command(
  'Ac',
  function(opts)
    vim.cmd('Ack --ignore-dir=src/test ' .. opts.args)
  end,
  { nargs = 1 }
)
