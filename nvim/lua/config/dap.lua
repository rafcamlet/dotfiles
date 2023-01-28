package.loaded["config/dap"] = nil

local mason = prequire("mason-nvim-dap")
if mason then mason.setup() end

local dap = prequire("dap")
local dapui = prequire("dapui")
if not dap or not dapui then return end

dapui.setup({
  layouts = {
    {
      elements = { "repl" },
      size = 0.30,
      position = "top",
    }
  }
})


vim.cmd [[command! Dap lua require("dapui").toggle()]]

vim.cmd([[nnoremap <silent> <F5> :lua require'dap'.continue()<CR>]])
vim.cmd([[nnoremap <silent> <F8> :lua require'dap'.step_over()<CR>]])
vim.cmd([[nnoremap <silent> <F9> :lua require'dap'.step_into()<CR>]])
vim.cmd([[nnoremap <silent> <F10> :lua require'dap'.step_out()<CR>]])
vim.cmd([[nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>]])
vim.cmd([[nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]])
vim.cmd([[nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]])
vim.cmd([[nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>]])
vim.cmd([[nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>]])

require("which-key").register({
  d = {
    name = "Dap",
    s = { function() require('dapui').float_element('stacks', { enter = true }) end, 'Callstack' },
    b = { function() require('dapui').float_element('breakpoints', { enter = true }) end, 'Breakpoints' }
  },
}, { prefix = "<leader>" })


-- dap.set_log_level('DEBUG')




-- local is_dap, dap = pcall(require, "dap")
-- if not is_dap then return end

-- local is_dap_install, dap_install = pcall(require, "dap-install")
-- if not is_dap_install then return end

-- local dbg_list = require("dap-install.debuggers_list").debuggers

-- dap_install.setup()

-- dap_install.config("ruby_vsc", {
--   configurations = {
--     {
--       name = "Run RSpec until the next failure",
--       type = "ruby",
--       request = "launch",
--       cwd = "${workspaceFolder}",
--       useBundler = false,
--       pathToBundler = "/home/r/.asdf/shims/bundle",
--       pathToRDebugIDE = "/home/r/.asdf/shims/rdebug-ide",
--       showDebuggerOutput = true,
--       program = "~/workdir/tmp/ruby_example.rb",
--       args = {''},
--     },
--   },
-- })

-- dap_install.config("ruby_vsc", {
--   configurations = {
--     {
--       name = "Run RSpec until the next failure",
--       type = "ruby",
--       request = "launch",
--       cwd = "${workspaceFolder}",
--       -- remoteWorkspaceRoot = "${workspaceRoot}",
--       -- remoteHost = "localhost",
--       -- remotePort = "1234"
--       useBundler = false,
--       -- pathToBundler = "/home/r/.asdf/shims/bundle",
--       -- pathToRDebugIDE = "/home/r/.asdf/shims/rdebug-ide",
--       showDebuggerOutput = true,
--       program = "bin/rails",
--       args = {'s'},
--     },
--   },
-- })

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
