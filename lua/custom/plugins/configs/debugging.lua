return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'suketa/nvim-dap-ruby',
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'

    require('dapui').setup()
    require('dap-ruby').setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = '[d]ebug [b]reakpoint' })
    vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = '[d]ebug [c]ontinue' })
  end,
}
