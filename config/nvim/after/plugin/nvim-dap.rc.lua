local status, dap = pcall(require, 'dap')
if (not status) then return end

local status2, dapui = pcall(require, 'dapui')
if (not status2) then return end

local status3, dap_vscode_js = pcall(require, 'dap-vscode-js')
if (not status3) then return end

vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<cr>')
vim.keymap.set('n', '<F6>', '<cmd>lua require"dap".terminate()<cr>')
vim.keymap.set('n', '<F1>', '<cmd>lua require"dap".step_over()<cr>')
vim.keymap.set('n', '<F2>', '<cmd>lua require"dap".step_into()<cr>')
vim.keymap.set('n', '<F3>', '<cmd>lua require"dap".step_out()<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<cr>')
vim.keymap.set('n', '<leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>')
vim.keymap.set('n', '<leader>lp',
  '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>')
vim.keymap.set('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<cr>')
vim.keymap.set('n', '<leader>dl', '<cmd>lua require"dap".run_last()<cr>')

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap_vscode_js.setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  -- adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    -- Defaults from https://github.com/mxsdev/nvim-dap-vscode-js
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Mocha Test",
      -- trace = true, -- include debugger info
      runtimeExecutable = "${workspaceFolder}/node_modules/ts-mocha/bin/ts-mocha",
      args = {
        "--opts",
        "src/test/mocha.opts",
        "--timeout",
        "999999",
        "--colors",
      },
      runtimeArgs = {
        "${file}"
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    }
  }
end
