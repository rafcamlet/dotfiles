local cmp = require'cmp'
local lspkind = require('lspkind')

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- before = function (entry, vim_item)
      --   return vim_item
      -- end
    })
  },
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then cmp.select_next_item() else cmp.complete() end
      end,
      c = function(fallback)
        vim.api.nvim_feedkeys(t('<down>'), 'n', true)
      end
    }),
    ['<C-p>'] = cmp.mapping({
      c = function()
        vim.api.nvim_feedkeys(t('<up>'), 'n', true)
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end
    }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort()
    }),
    ['<c-k>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'nvim_lsp' },
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

--[[ -- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
}) ]]

-- Use cmdline & path source for ':'.
local mapping = cmp.mapping.preset.cmdline()
mapping["<C-p>"] = nil
mapping["<C-n>"] = nil

cmp.setup.cmdline(':', {
  mapping = mapping,
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

