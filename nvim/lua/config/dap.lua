package.loaded['config/dap'] = nil

local _, dap = pcall(require, 'dap')
if not dap then return end

local _, dap_install = pcall(require, 'dap-install')
if not dap_install then return end

-- local dbg_list = require("dap-install.debuggers_list").debuggers

dap_install.setup()
dap_install.config('ruby_vsc_dbg', {})

-- dap.adapters.ruby = {
--   type = 'executable';
--   command = 'node';
--   args = {'/root/main.js'};
-- }

-- dap.configurations.ruby = {
--   {
--     type = 'ruby';
--     request = 'launch';
--     name = 'ruby';
--     program = '/root/test.rb';
--     programArgs = {};
--     useBundler = false;
--   },
-- }

dap.adapters.cpptools = {
  type = 'executable',
  command = vim.fn.expand('~/src/cppdbg/debugAdapters/OpenDebugAD7')
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "cpptools",
    request = "launch",
    program = function()
      vim.fn.system('cargo build')
      if rust_program then return rust_program end
      rust_program = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
      return rust_program
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
