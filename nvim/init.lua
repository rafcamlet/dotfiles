local config_file = require("config.helpers").config_file

config_file "keybindings"
config_file "settings"

require "config.plugins"

if os.getenv('INSTALL') then return end

require "config.lsp"
require "config.dap"

vim.cmd 'colorscheme onedark'

vim.cmd([[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="Visual", timeout=250} ]])

vim.cmd([[command! -nargs=1 Boss :call luaeval("require'boss'.eval(_A)", <q-args>)]])

vim.cmd([[ nnoremap <silent> <f2> :silent! Boss c"lua require'byline'.setup()"<cr>]])
vim.cmd([[ nnoremap <f3> <cmd>Boss c"lua require'byline'.setup()" c"vs"<cr>]])

vim.cmd([[nnoremap <c-q> <cmd>lua require'scripts'.quickfix_toggle()<cr>]])

vim.cmd([[nnoremap <space>f <cmd>lua require'scripts'.send_to_tmux()<cr>]])
vim.cmd([[vnoremap <leader>f <cmd>lua require'scripts'.send_to_tmux(true)<cr>]])

vim.cmd([[nnoremap <space>og <cmd>lua require'finders'.git()<cr>]])
vim.cmd([[nnoremap <space>of <cmd>lua require'finders'.grep()<cr>]])
vim.cmd([[nnoremap <space>oo <cmd>lua require'finders'.find()<cr>]])
vim.cmd([[nnoremap <space>oq <cmd>lua require'finders'.find {cwd = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h'), pattern = "(lua\|vim)$" }<cr>]])

vim.cmd([[nmap <leader>t <Plug>PlenaryTestFile]])

function snap_grep()

  local snap = require'snap'
  local io = snap.get'common.io'

  local function producer (request)
    local string, glob

    if #request.filter <= 3 then
      return coroutine.yield(nil)
    end

    local cwd = snap.sync(vim.fn.getcwd)

    string = request.filter

    if string.find(string, ";") then
      glob = string.sub(string, string.find(string, ";") + 1, #string)
      string = string.sub(string, 1, string.find(string, ";") - 1)
    end

    rg_args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", string }

    --[[ if glob then
    table.insert(rg_args, "-g")
    table.insert(rg_args, glob)
  end ]]

  for data, err, kill in io.spawn("rg", rg_args, cwd) do
    -- If the filter updates while the command is still running
    -- then we kill the process and yield nil
    if request.canceled() then
      kill()
      coroutine.yield(nil)
    elseif (err ~= "") then
      -- If there is an error we yield nil
      coroutine.yield(nil)
    elseif (data == "") then
      -- If the data is empty we yield an empty table
      coroutine.yield({})
    else
      -- If there is data we split it by newline
      coroutine.yield(vim.split(data, "\n", true))
    end
  end
end

local tbl = snap.get("common.tbl")

local function consumer(prod)
  return function(request)
    local results = {}

    for data in snap.consume(prod, request) do
      tbl.accumulate(results, data)
      snap.continue()
    end

    if not tostring(request.filter):find(";") then
      return coroutine.yield(results)
    end

    local filter = string.sub(request.filter, string.find(request.filter, ";") + 1, #request.filter)

    if filter == "" then
      return coroutine.yield(results)
    end

    local cwd = snap.sync(vim.fn.getcwd)
    local stdout = vim.loop.new_pipe(false)

    for data, err, cancel in io.spawn("fzy", {"-e", filter}, cwd, stdout) do
      local results_string
      results_string = table.concat(vim.tbl_map(tostring, results), "\n")
      stdout:write(results_string)
      stdout:shutdown()

      if request.canceled() then
        cancel()
        coroutine.yield(nil)
      elseif (err ~= "") then
        coroutine.yield(nil)
      elseif (data == "") then
        snap.continue()
      else
        coroutine.yield(vim.split(data:sub(1, -2), "\n", true))
      end
    end
  end
end

snap.run {
  producer = consumer(producer),
  select = snap.get'select.vimgrep'.select,
  views = { snap.get'preview.vimgrep' },
  layout = snap.get'layout'.centered
  -- reverse = true
}
end


vim.cmd([[nnoremap <space>of <cmd>lua snap_grep()<cr>]])
