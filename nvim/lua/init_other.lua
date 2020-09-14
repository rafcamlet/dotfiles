local U = require'snippets.utils'

require'snippets'.snippets = {
  _global = {
    todo = "TODO:",
    -- uname = function() return vim.loop.os_uname().sysname end,
    -- date = os.date,
    -- rand = "random number: ${=tostring(math.random(5))}",
    -- epoch = "Spierdalaj! ${=vim.loop.os_uname().sysname} co za gówno",
    -- note = [[NOTE(${=io.popen("id -un"):read"*l"}): ]],
    -- test = [[t $1 ${|S[1]:upper()} ]],
    -- func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
    test = [[ ${1:wow} asdf ]],
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
  }
}

function snippets_or_what()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<left><right>', true, false, true), 'n', true)
  vim.api.nvim_command('CocDisable')
  require"snippets".expand_or_advance(1)
  vim.api.nvim_command('CocEnable')
end

local projects = require('projects')
require'nvim-treesitter.configs'.setup {
  ensure_installed = "lua",
  highlight = {
    enable = false,
    disable = { "c", "rust", "ruby" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gnn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}


require "nvim-treesitter.highlight"
local hlmap = vim.treesitter.highlighter.hl_map

--Misc
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = "Delimiter"

-- Constants
hlmap["constant"] = "Constant"
hlmap["constant.builtin"] = "Type"
hlmap["constant.macro"] = "Define"
hlmap["string"] = "String"
hlmap["string.regex"] = "String"
hlmap["string.escape"] = "SpecialChar"
hlmap["character"] = "Character"
hlmap["number"] = "Number"
hlmap["boolean"] = "Boolean"
hlmap["float"] = "Float"

-- Functions
hlmap["function"] = "Function"
hlmap["function.builtin"] = "Special"
hlmap["function.macro"] = "Macro"
hlmap["parameter"] = "Identifier"
hlmap["method"] = "Function"
hlmap["field"] = "Identifier"
hlmap["property"] = "Identifier"
hlmap["constructor"] = "Type"

-- Keywords
hlmap["conditional"] = "Conditional"
hlmap["repeat"] = "Repeat"
hlmap["label"] = "Label"
hlmap["operator"] = "Operator"
hlmap["keyword"] = "Repeat"
hlmap["exception"] = "Exception"
hlmap["include"] = "Include"
hlmap["type"] = "Type"
hlmap["type.builtin"] = "Type"
hlmap["structure"] = "Structure"

hl_color('TSCurrentScope', nil, 234)

hl_color('TSDefinitionUsage', 1)
hl_color('TSDefinition', 2)
