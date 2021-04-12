require('plenary.reload').reload_module('init')

local vimp = require('vimp')
-- vimp.unmap_all()

require 'config/colors'
require 'config/projects'
require 'config/telescope'
require 'config/finders'
require 'config/treesitter'
require 'config/completion'
require 'config/lsp'

require('tabline').setup()
require('jumper').setup()
require('terminal').setup()

vim.cmd([[command! -nargs=1 Boss :call luaeval("require'boss'.eval(_A)", <q-args>)]])

require 'luapad'.config{
  context = {
    hl_color = require('helpers').hl_color,
  }
}

-- Temp settings ↓

local dap = require('dap')

dap.adapters.ruby = {
  type = 'executable';
  command = 'node';
  args = {'/home/r2d2/.config/nvim/bundle/vimspector/gadgets/linux/cust_vscode-ruby/dist/debugger/main.js'};
}

dap.configurations.ruby = {
  {
    type = 'ruby';
    request = 'launch';
    name = 'Rails';
    cwd = '/home/r2d2/projects/milabo',
    program = 'bin/rails';
    args = {'s'};
  },
}

require('lspkind').init({
    -- with_text = true,
    -- symbol_map = {
    --   Text = '',
    --   Method = 'ƒ',
    --   Function = '',
    --   Constructor = '',
    --   Variable = '',
    --   Class = '',
    --   Interface = 'ﰮ',
    --   Module = '',
    --   Property = '',
    --   Unit = '',
    --   Value = '',
    --   Enum = '了',
    --   Keyword = '',
    --   Snippet = '﬌',
    --   Color = '',
    --   File = '',
    --   Folder = '',
    --   EnumMember = '',
    --   Constant = '',
    --   Struct = ''
    -- },
})


require 'simple-wiki'.setup {
  path = '~/Dropbox/wiki',
  link_key_mapping = 'gf'
}

vimp.map_command('Wiki', require "simple-wiki".index)
vimp.nnoremap({'override'}, '-', require "simple-wiki".index)
vimp.nnoremap({'override'}, '_', require "simple-wiki".search)

local ruby_helpers = require 'ruby_helpers'
vimp.map_command('RubyOpenStyle', ruby_helpers.open_style)
vimp.nnoremap({'override'}, '<space>s', ruby_helpers.open_style)

-- local tabinator = require'tabinator'
-- tabinator.setup()
-- vimp.nnoremap({'override'}, '<space>ot', tabinator.find)


vimp.map_command('C', function()
  vim.lsp.diagnostic.clear(vim.api.nvim_get_current_buf())
end)

-- ===========

-- local magic_snips = require 'magic-snips'
-- magic_snips.setup()
--
-- magic_snips.add {
--   trigger = 'test$',
--   content = [[
--   ($1)($2) -
--
--
--   -> `v[2]`-`v[1]` --
--   ]]
-- }
--
--
-- magic_snips.add {
--   trigger = 'a$',
--   content = [[
--   $1|$2
--   `v[1]`-`v[2]`
--   ]]
-- }
--
-- vim.cmd('inoremap <c-u> <cmd>lua require"magic-snips".magic_snips()<cr>')
-- vim.cmd('inoremap <c-i> <cmd>lua require"magic-snips".prev()<cr>')



-- magic_snips.add {
--   context = {
--     line = function()
--       return ('='):rep(#v[1])
--     end
--   },
--   trigger = 'box$',
--   content = [[
--   `line()`
--   $1
--   `v[1]:upper()`
--   `line()`
--   ]]
-- }


-- magic_snips.add {
--   context = {
--     val = 42,
--     doc = function()
--       if #v[2] == 0 then return end
--       local result = {}
--       for _, v in ipairs(vim.split(v[2], ', ')) do
--         table.insert(result, '-- @param ' .. v)
--       end
--       return result
--     end
--   },
--   trigger = 'fun$',
--   content = [[
--   `doc()`
--   local function $1($2)
--     -- This is content of method `v[1]:upper()`
--     -- This is value defined in context: `val`
--     return `math.random(100)` -- random number
--   end
--   ]]
-- }

-- magic_snips.add {
--   trigger = 'clone$',
--   content = '$1 - $1 - $1'
-- }

pcall(vim.cmd, 'unmap override')
