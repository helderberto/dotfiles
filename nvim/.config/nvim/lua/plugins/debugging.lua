local exts = {
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mxsdev/nvim-dap-vscode-js',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'mxsdev/nvim-dap-vscode-js',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      local dap_vscode_js = require('dap-vscode-js')
      local dap_utils = require('dap.utils')

      dap_vscode_js.setup({
        -- node_path = 'node', -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter', -- Path to vscode-js-debug installation.
        debugger_cmd = { 'js-debug-adapter' }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { 'pwa-node' }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        port = 8124, -- or any other free port
      })

      for _, ext in ipairs(exts) do
        dap.configurations[ext] = {
          -- {
          --   type = 'pwa-chrome',
          --   request = 'launch',
          --   name = 'Launch Chrome with "localhost"',
          --   url = 'http://localhost:3000',
          --   webRoot = '${workspaceFolder}',
          -- },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch Current File (pwa-node)',
            cwd = vim.fn.getcwd(),
            args = { '${file}' },
            sourceMaps = true,
            protocol = 'inspector',
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch Current File (pwa-node with ts-node)',
            cwd = vim.fn.getcwd(),
            runtimeArgs = { '--loader', 'ts-node/esm' },
            runtimeExecutable = 'node',
            args = { '${file}' },
            sourceMaps = true,
            protocol = 'inspector',
            skipFiles = { '<node_internals>/**', 'node_modules/**' },
            resolveSourceMapLocations = {
              '${workspaceFolder}/**',
              '!**/node_modules/**',
            },
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch Test Current File (pwa-node with jest)',
            cwd = vim.fn.getcwd(),
            runtimeArgs = { '${workspaceFolder}/node_modules/.bin/jest' },
            runtimeExecutable = 'node',
            args = { '${file}', '--coverage', 'false' },
            rootPath = '${workspaceFolder}',
            sourceMaps = true,
            console = 'integratedTerminal',
            internalConsoleOptions = 'neverOpen',
            skipFiles = { '<node_internals>/**', 'node_modules/**' },
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch Test Current File (pwa-node with vitest)',
            cwd = vim.fn.getcwd(),
            program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
            args = { '--inspect-brk', '--threads', 'false', 'run', '${file}' },
            autoAttachChildProcesses = true,
            smartStep = true,
            console = 'integratedTerminal',
            skipFiles = { '<node_internals>/**', 'node_modules/**' },
          },
          {
            type = 'pwa-chrome',
            request = 'attach',
            name = 'Attach Program (pwa-chrome, select port)',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            port = function()
              return vim.fn.input('Select port: ', 9222)
            end,
            webRoot = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach Program (pwa-node, select pid)',
            cwd = vim.fn.getcwd(),
            processId = dap_utils.pick_process,
            skipFiles = { '<node_internals>/**' },
          },
        }
      end

      -- Better debugging interface
      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- keybindings
      keymap('n', '<Leader>da', "<CMD>lua require('dap').continue()<CR>", opts)
      keymap('n', '<Leader>db', "<CMD>lua require('dap').toggle_breakpoint()<CR>", opts)
      keymap('n', '<Leader>dc', "<CMD>lua require('dap').continue()<CR>", opts)
      keymap('n', '<Leader>dd', "<CMD>lua require('dap').continue()<CR>", opts)
      keymap('n', '<Leader>dh', "<CMD>lua require('dapui').eval()<CR>", opts)
      keymap('n', '<Leader>di', "<CMD>lua require('dap').step_into()<CR>", opts)
      keymap('n', '<Leader>do', "<CMD>lua require('dap').step_out()<CR>", opts)
      keymap('n', '<Leader>dO', "<CMD>lua require('dap').step_over()<CR>", opts)
      keymap('n', '<Leader>dt', "<CMD>lua require('dap').terminate()<CR>", opts)
      keymap('n', '<Leader>dU', "<CMD>lua require('dapui').open()<CR>", opts)
      keymap('n', '<Leader>dC', "<CMD>lua require('dapui').close()<CR>", opts)

      keymap('n', '<Leader>dw', "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>", opts)
      keymap('n', '<Leader>ds', "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>", opts)
      keymap('n', '<Leader>dr', "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>", opts)
    end,
  },
}
