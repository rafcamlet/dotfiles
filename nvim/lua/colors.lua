vim.cmd('set termguicolors')

local hl_color = require('helpers').hl_color
local after_init = require('helpers').after_init

after_init('unload_colors', 'lua package.loaded.colors = nil')

local Colors = {}

require'colorizer'.setup()

Colors.white =            '#ffffff'
Colors.black =            '#000000'
Colors.ruby_red =         '#ff5f5f'
Colors.red =              '#c93a2a'
Colors.blue =             '#376a6d'
Colors.yellow =           '#c89726'
Colors.green =            '#93961e'
Colors.pink =             '#ff5f87'
Colors.background =       '#262626'
Colors.brown =            '#af875f'
Colors.light_borwn =      '#af8787'

Colors.paradiso =         '#458588'
Colors.tapestry =         '#B16286'
Colors.cancan =           '#D3869B'
Colors.cadetblue =        '#749186'

Colors.variable =         '#8787af'
Colors.other_light_borwn ='#947cc5'
Colors.chetwode_blue =    '#6C6CAC'
Colors.trendy_pink =      '#8C6C8C'
Colors.very_light_blue =  '#87afff'

Colors.special =          '#ff8700'
Colors.bone =             '#faf4c6'
Colors.horse_green =      "#b1d631"

Colors.other_green =      "#afd787"
Colors.visual =           "#458588"


Colors.error =            '#FF6666'
Colors.warning =          '#E0B652'

Colors.gray1 =  '#0b0b0b'
Colors.gray2 =  '#0e0e0e'
Colors.gray3 =  '#161616'
Colors.gray4 =  '#1e1e1e'
Colors.gray5 =  '#262626'
Colors.gray6 =  '#2e2e2e'
Colors.gray7 =  '#363636'
Colors.gray8 =  '#3e3e3e'
Colors.gray9 =  '#464646'
Colors.gray10 = '#4e4e4e'
Colors.gray11 = '#565656'
Colors.gray12 = '#5e5e5e'
Colors.gray13 = '#666666'
Colors.gray14 = '#6e6e6e'
Colors.gray15 = '#767676'
Colors.gray16 = '#7e7e7e'
Colors.gray17 = '#868686'
Colors.gray18 = '#8e8e8e'
Colors.gray19 = '#969696'
Colors.gray20 = '#9e9e9e'
Colors.gray21 = '#a6a6a6'
Colors.gray22 = '#aeaeae'
Colors.gray23 = '#b6b6b6'
Colors.gray24 = '#bebebe'

hl_color('Normal', Colors.brown, Colors.background)

hl_color('Comment', Colors.gray14)
hl_color('Todo', Colors.pink)
hl_color('String', Colors.other_green)
hl_color('Boolean', Colors.horse_green)
hl_color('Identifier', Colors.horse_green)
hl_color('Function', Colors.white)
hl_color('Type', Colors.variable)
hl_color('Statement', Colors.variable)
hl_color('Keyword', Colors.special)
hl_color('Constant', Colors.special)
hl_color('Number', Colors.special)
hl_color('Special', Colors.special)
hl_color('PreProc', Colors.bone)
hl_color('Pmenu', Colors.gray20)
hl_color('PmenuSel', Colors.gray20, Colors.gray9)
hl_color('LineNr', Colors.gray13, Colors.black)
hl_color('NonText', Colors.gray14) -- 208
hl_color('LineNr', Colors.gray14, Colors.black) -- 208
hl_color('VertSplit', Colors.gray8, Colors.gray8)
hl_color('StatusLine', Colors.black, Colors.black) -- 207
hl_color('StatusLineNC', nil, Colors.black) -- 207
hl_color('Folded', Colors.gray16, Colors.black) -- 208
hl_color('FoldedColumn', nil, Colors.black) -- 208
hl_color('Visual', Colors.white, Colors.visual)
hl_color('TabLine', nil, Colors.gray1)


hl_color('TSVariable', Colors.variable)
hl_color('TSKeyword', Colors.special )
hl_color('TSKeywordFunction', Colors.special )
hl_color('TSProperty', Colors.light_borwn )
hl_color('TSBoolean', Colors.tapestry )
hl_color('TSOperator', Colors.paradiso )
hl_color('TSFunction', Colors.cadetblue )
hl_color('TSPunctSpecial', Colors.green)
hl_color('TSConstBuiltin', Colors.green)
hl_color('TSConstMacro', Colors.green)
hl_color('TSString', Colors.other_green)
hl_color('TSNumber', Colors.special)
hl_color('TSBoolean', Colors.tapestry)
hl_color('TSFunction', Colors.cadetblue)
hl_color('TSKeyword', Colors.chetwode_blue)
hl_color('TSType', Colors.variable)
hl_color('TSMethod', Colors.white)
hl_color('TSConstructor', Colors.special)
hl_color('TSConditional', Colors.other_light_borwn)
hl_color('TSInclude', Colors.bone)
hl_color('TSVariableBuiltin', Colors.special)
hl_color('TSKeywordFunction', Colors.variable)
hl_color('TSConstant', Colors.special)

hl_color('YankHighlight', nil, Colors.gray8)


hl_color('TelescopeBorder', Colors.paradiso)
hl_color('TelescopeMatching', Colors.special)
hl_color('TelescopeSelection', nil, Colors.gray1)
hl_color('TelescopeNormal', Colors.gray20)


hl_color('LspDiagnosticsVirtualTextError', Colors.error)
hl_color('LspDiagnosticsVirtualTextWarning', Colors.warning)

-- -----

hl_color('TSPunctSpecial', Colors.yellow)
hl_color('TSStringRegex', Colors.yellow)
hl_color('TSStringEscape', Colors.yellow)
hl_color('TSCharacter', Colors.yellow)
hl_color('TSFloat', Colors.yellow)
hl_color('TSFuncBuiltin', Colors.yellow)
hl_color('TSFuncMacro', Colors.yellow)
hl_color('TSParameter', Colors.yellow)
hl_color('TSParameterReference', Colors.yellow)
hl_color('TSField', Colors.yellow)
hl_color('TSRepeat', Colors.yellow)
hl_color('TSLabel', Colors.yellow)
hl_color('TSException', Colors.yellow)
hl_color('TSTypeBuiltin', Colors.yellow)
hl_color('TSNamespace', Colors.yellow)
hl_color('TSAnnotation', Colors.yellow)
hl_color('TSText', Colors.yellow)
hl_color('TSStrong', Colors.yellow)
hl_color('TSEmphasis', Colors.yellow)
hl_color('TSUnderline', Colors.yellow)
hl_color('TSTitle', Colors.yellow)
hl_color('TSLiteral', Colors.yellow)
hl_color('TSURI', Colors.yellow)
hl_color('TSError', Colors.green)

-- Vim wiki

hl_color('VimwikiLink', '#39A3AC')
hl_color('Conceal', Colors.red)
hl_color('VimwikiCode', Colors.special)
hl_color('VimwikiPre', Colors.gray14)
hl_color('VimwikiBold', Colors.special)
hl_color('VimwikiWeblink1', Colors.ruby_red)
hl_color('VimwikiBold', Colors.special)

-- ---


require'nvim-web-devicons'.setup {
  override = {
    rb = {
      icon = "",
      color = Colors.ruby_red,
      name = "Rb"
    }
  },
  default = true;
}

return Colors

-- local Colors = require('colors')
-- local hl_color = require('helpers').hl_color

-- hl_color("Boolean", Colors.pink)
-- hl_color("ColorColumn", Colors.pink)
-- hl_color("Comment", Colors.pink)
-- hl_color("Constant", Colors.pink)
-- hl_color("Cursor", Colors.pink)
-- hl_color("CursorColumn", Colors.pink)
-- hl_color("CursorLine", Colors.pink)
-- hl_color("FoldColumn", Colors.pink)
-- hl_color("Folded", Colors.pink)
-- hl_color("Function", Colors.pink)
-- hl_color("Identifier", Colors.pink)
-- hl_color("IncSearch", Colors.pink)
-- hl_color("Keyword", Colors.pink)
-- hl_color("LineNr", Colors.pink)
-- hl_color("MatchParen", Colors.pink)
-- hl_color("NonText", Colors.pink)
-- hl_color("Normal", Colors.pink)
-- hl_color("Number", Colors.pink)
-- hl_color("Pmenu", Colors.pink)
-- hl_color("PmenuSel", Colors.pink)
-- hl_color("PreProc", Colors.pink)
-- hl_color("Search", Colors.pink)
-- hl_color("SignColumn", Colors.pink)
-- hl_color("Special", Colors.pink)
-- hl_color("SpecialKey", Colors.pink)
-- hl_color("Statement", Colors.pink)
-- hl_color("StatusLine", Colors.pink)
-- hl_color("StatusLineNC", Colors.pink)
-- hl_color("String", Colors.pink)
-- hl_color("TabLine", Colors.pink)
-- hl_color("TabLineFill", Colors.pink)
-- hl_color("TabLineSel", Colors.pink)
-- hl_color("Title", Colors.pink)
-- hl_color("Todo", Colors.pink)
-- hl_color("Type", Colors.pink)
-- hl_color("VertSplit", Colors.pink)
-- hl_color("Visual", Colors.pink)
-- hl_color("WildMenu", Colors.pink)
-- hl_color("diffAdd", Colors.pink)
-- hl_color("diffAdded", Colors.pink)
-- hl_color("diffChange", Colors.pink)
-- hl_color("diffDelete", Colors.pink)
-- hl_color("diffRemoved", Colors.pink)
-- hl_color("diffText", Colors.pink)

