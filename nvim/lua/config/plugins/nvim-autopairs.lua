local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local endwise = require('nvim-autopairs.ts-rule').endwise

npairs.setup()
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

npairs.add_rules({
  endwise('then$', 'end', 'lua', nil),
  endwise('function.*%(.*%)$', 'end', 'lua', nil),
})
