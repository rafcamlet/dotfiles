package.loaded["config/dap"] = nil

local is_dap, dap = pcall(require, "dap")
if not is_dap then return end

local is_dap_install, dap_install = pcall(require, "dap-install")
if not is_dap_install then return end

-- local dbg_list = require("dap-install.debuggers_list").debuggers

dap_install.setup()

dap_install.config("ruby_vsc", {
  configurations = {
    {
      name = "Run RSpec until the next failure",
      type = "ruby",
      request = "launch",
      cwd = "${workspaceFolder}",
      useBundler = true,
      pathToBundler = "/home/r/.asdf/shims/bundle",
      pathToRDebugIDE = "/home/r/.asdf/shims/rdebug-ide",
      showDebuggerOutput = true,
      program = "${workspaceFolder}/bin/rspec",
      args = { "--next-failure" },
    },
  },
})

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
  type = "executable",
  command = vim.fn.expand("~/src/cppdbg/debugAdapters/OpenDebugAD7"),
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "cpptools",
    request = "launch",
    program = function()
      vim.fn.system("cargo build")
      if rust_program then
        return rust_program
      end
      rust_program = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
      return rust_program
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
  },
}

dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input("Host [127.0.0.1]: ")
      if value ~= "" then
        return value
      end
      return "127.0.0.1"
    end,
    port = function()
      local val = tonumber(vim.fn.input("Port: "))
      assert(val, "Please provide a port number")
      return val
    end,
  },
}

dap.adapters.nlua = function(callback, config)
  callback({ type = "server", host = config.host, port = config.port })
end

local is_dapui, dapui = pcall(require, "dapui")
if not is_dapui then return end
dapui.setup()
