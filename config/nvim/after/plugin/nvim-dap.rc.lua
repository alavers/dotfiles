local status, dap = pcall(require, 'dap')
if (not status) then return end

local status2, dapui = pcall(require, 'dapui')
if (not status2) then return end

local status3, dap_vscode_js = pcall(require, 'dap-vscode-js')
if (not status3) then return end

vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<F1>', ':lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<F2>', ':lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<F3>', ':lua require"dap".step_out()<CR>')
vim.keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint("Breakpoint condition: ")<CR>')
vim.keymap.set('n', '<leader>lp', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')
vim.keymap.set('n', '<leader>dl', ':lua require"dap".run_last()<CR>')

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
