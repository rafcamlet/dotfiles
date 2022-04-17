-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  LuaSnip = {
    config = { "require 'config.plugins.luasnip'" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\2ê\3\0\0\a\0\16\0\"6\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\3\a\0'\4\b\0'\5\t\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\n\0'\5\v\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\f\0'\5\r\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\14\0'\5\15\0\18\6\1\0B\2\5\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  boss = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/boss",
    url = "/home/r/projects/boss"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen" },
    config = { 'require"diffview".setup()' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dirbuf.nvim"] = {
    commands = { "Dirbuf" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/dirbuf.nvim",
    url = "https://github.com/elihunter173/dirbuf.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["file-line"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/file-line",
    url = "https://github.com/bogado/file-line"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    config = { "\27LJ\2\2í\2\0\0\4\0\f\0\0254\0\3\0005\1\0\0005\2\1\0=\2\2\1>\1\1\0005\1\3\0005\2\4\0=\2\2\1>\1\2\0006\1\5\0'\2\6\0B\1\2\0016\1\a\0009\1\b\0019\1\t\0016\2\a\0009\2\b\0029\2\n\2B\2\1\0A\1\0\0026\2\v\0\18\3\1\0B\2\2\0028\2\2\0L\2\2\0\rtonumber\fgetchar\fnr2char\afn\bvim3Select formatter (1) pg_format, (2) sqlformat:\nprint\1\5\0\0\6-\a-k\nupper\a-a\1\0\2\nstdin\2\bexe\14sqlformat\targs\1\4\0\0\6-\a-W\0065\1\0\2\nstdin\2\bexe\14pg_format7\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\nstdin\2\bexe\vstylua∑\1\1\0\5\0\15\0\0226\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0006\2\4\0009\2\5\0029\2\6\0029\2\a\2=\2\b\0015\2\n\0004\3\3\0003\4\t\0>\4\1\3=\3\v\0024\3\3\0003\4\f\0>\4\1\3=\3\r\2=\2\14\1B\0\2\1K\0\1\0\rfiletype\blua\0\bsql\1\0\0\0\14log_level\tINFO\vlevels\blog\bvim\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  fzf = {
    commands = { "FZF" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["galaxyline.nvim"] = {
    config = { 'require"config.statusline"' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'pcall(require, "config/plugins/gitsigns")' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'pcall(require, "config/plugins/indent-blankline")' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  jumper = {
    config = { 'require"jumper".setup()' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/jumper",
    url = "/home/r/projects/jumper"
  },
  kommentary = {
    config = { "\27LJ\2\2|\0\0\3\0\5\0\b6\0\0\0'\1\1\0B\0\2\0029\0\2\0'\1\3\0005\2\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lush.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["luv-vimdocs"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/luv-vimdocs",
    url = "https://github.com/nanotee/luv-vimdocs"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { 'pcall(require, "config/plugins/neo-tree")' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("nvim-autopairs").setup()' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { 'require "config.plugins.nvim-cmp"' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require"colorizer".setup()' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-luapad",
    url = "/home/r/projects/nvim-luapad"
  },
  ["nvim-miniyank"] = {
    config = { "\27LJ\2\2Õ\1\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0≠\1    map p <Plug>(miniyank-autoput)\n    map P <Plug>(miniyank-autoPut)\n    map <silent><c-p> <Plug>(miniyank-cycle)\n    map <silent><c-n> <Plug>(miniyank-cycleback)\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-miniyank",
    url = "https://github.com/Arkham/nvim-miniyank"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\2y\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµÊÃô\19ô≥Ê˛\3˚\1\1\0\3\0\r\0\0206\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0'\1\t\0=\1\b\0006\0\6\0009\0\n\0'\1\v\0B\0\2\0016\0\0\0'\1\f\0B\0\2\1K\0\1\0#config.plugins.nvim-toggleterm\30tnoremap <c-]> <c-\\><c-n>\bcmd\f#595959\21terminal_color_8\6g\bvim\tsize\1\0\2\17open_mapping\n<c-\\>\14direction\rvertical\0\nsetup\15toggleterm\frequire\0" },
    keys = { { "", "<c-\\>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'pcall(require, "config/plugins/nvim-treesitter")' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\2ê\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\4\0005\3\3\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\arb\1\0\0\1\0\3\ncolor\f#ff5f5f\ticon\bÓûë\tname\aRb\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/one-small-step-for-vimkind",
    url = "https://github.com/jbyuki/one-small-step-for-vimkind"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pounce.nvim"] = {
    config = { 'pcall(require, "config/plugins/pounce")' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { 'pcall(require, "config/plugins/pretty-fold")' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  rails_spotting = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/rails_spotting",
    url = "/home/r/projects/rails_spotting"
  },
  ["rust-tools.nvim"] = {
    config = { 'require "config.plugins.rust-tools"' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["sidebar.nvim"] = {
    config = { 'pcall(require, "config/plugins/sidebar")' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/sidebar.nvim",
    url = "https://github.com/sidebar-nvim/sidebar.nvim"
  },
  ["simple-wiki.nvim"] = {
    config = { "\27LJ\2\2˝\1\0\0\2\0\b\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0'\1\6\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0B\0\2\1K\0\1\0;nnoremap _ <CMD>lua require \"simple-wiki\".search()<CR>:nnoremap - <CMD>lua require \"simple-wiki\".index()<CR>\bcmd\bvim\1\0\2\21link_key_mapping\agf\tpath\19~/Dropbox/wiki\nsetup\16simple-wiki\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/simple-wiki.nvim",
    url = "/home/r/projects/simple-wiki.nvim"
  },
  ["splitjoin.vim"] = {
    config = { "\27LJ\2\2∑\1\0\0\2\0\5\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0002splitjoin_html_attributes_bracket_on_new_line splitjoin_ruby_hanging_args splitjoin_ruby_curly_braces\6g\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["tabline-framework.nvim"] = {
    config = { "\27LJ\2\2ü\2\0\0\4\0\15\0\0216\0\0\0009\0\1\0)\1\2\0=\1\2\0006\0\3\0'\1\4\0B\0\2\0029\0\5\0005\1\a\0006\2\3\0'\3\6\0B\2\2\2=\2\b\0015\2\t\0=\2\n\0015\2\v\0=\2\f\0015\2\r\0=\2\14\1B\0\2\1K\0\1\0\fhl_fill\1\0\2\abg\f#000000\afg\f#ffffff\vhl_sel\1\0\2\abg\f#282c34\afg\f#abb2bf\ahl\1\0\2\abg\f#181A1F\afg\f#abb2bf\vrender\1\0\0-tabline_framework.examples.fancy_indexes\nsetup\22tabline_framework\frequire\16showtabline\bopt\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/tabline-framework.nvim",
    url = "https://github.com/rafcamlet/tabline-framework.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble" },
    config = { "\27LJ\2\2\1\0\0\b\0\16\0\0286\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0026\1\0\0'\2\4\0B\1\2\0029\2\2\0015\3\14\0005\4\f\0005\5\b\0005\6\6\0009\a\5\0=\a\a\6=\6\t\0055\6\n\0009\a\5\0=\a\a\6=\6\v\5=\5\r\4=\4\15\3B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-e>\1\0\0\22open_with_trouble\14telescope trouble.providers.telescope\nsetup\ftrouble\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["typescript-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-jsx-typescript"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-jsx-typescript",
    url = "https://github.com/peitalin/vim-jsx-typescript"
  },
  ["vim-quickrun"] = {
    commands = { "QuickRun" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/vim-quickrun",
    url = "https://github.com/thinca/vim-quickrun"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-slim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-slim",
    url = "https://github.com/slim-template/vim-slim"
  },
  ["vim-startuptime"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\2\2Ê\6\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0∆\6    let g:VM_Mono_hl   = 'Visual'\n    let g:VM_Extend_hl = 'WildMenu'\n    let g:VM_Cursor_hl = 'Visual'\n    let g:VM_Insert_hl = 'IncSearch'\n\n    let g:VM_highlight_matches = 'red'\n    let g:VM_leader = '<space>'\n    let g:VM_maps = {}\n    let g:VM_maps['Find Under']         = '<C-d>'\n    let g:VM_maps['Find Subword Under'] = '<C-d>'\n\n    let g:VM_maps['Add Cursor Down']             = '<C-U>'\n    let g:VM_maps['Visual Cursors']              = '<space>'\n    let g:VM_maps['Switch Mode']                 = 'v'\n    let g:VM_maps['Visual Regex']                = '/'\n\n    \" autocmd User visual_multi_start nnoremap <c-l> l\n    \" autocmd User visual_multi_start nnoremap <c-h> h\n    \" autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>\n    \" autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    commands = { "WhichKey" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["workspaces.nvim"] = {
    config = { "require'workspaces'.setup()" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/workspaces.nvim",
    url = "https://github.com/natecraddock/workspaces.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
pcall(require, "config/plugins/nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require "config.plugins.nvim-cmp"
time([[Config for nvim-cmp]], false)
-- Config for: simple-wiki.nvim
time([[Config for simple-wiki.nvim]], true)
try_loadstring("\27LJ\2\2˝\1\0\0\2\0\b\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0'\1\6\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0B\0\2\1K\0\1\0;nnoremap _ <CMD>lua require \"simple-wiki\".search()<CR>:nnoremap - <CMD>lua require \"simple-wiki\".index()<CR>\bcmd\bvim\1\0\2\21link_key_mapping\agf\tpath\19~/Dropbox/wiki\nsetup\16simple-wiki\frequire\0", "config", "simple-wiki.nvim")
time([[Config for simple-wiki.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
pcall(require, "config/plugins/neo-tree")
time([[Config for neo-tree.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require"config.statusline"
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("nvim-autopairs").setup()
time([[Config for nvim-autopairs]], false)
-- Config for: jumper
time([[Config for jumper]], true)
require"jumper".setup()
time([[Config for jumper]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\2ê\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\4\0005\3\3\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\arb\1\0\0\1\0\3\ncolor\f#ff5f5f\ticon\bÓûë\tname\aRb\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
try_loadstring("\27LJ\2\2∑\1\0\0\2\0\5\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0002splitjoin_html_attributes_bracket_on_new_line splitjoin_ruby_hanging_args splitjoin_ruby_curly_braces\6g\bvim\0", "config", "splitjoin.vim")
time([[Config for splitjoin.vim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require"colorizer".setup()
time([[Config for nvim-colorizer.lua]], false)
-- Config for: pounce.nvim
time([[Config for pounce.nvim]], true)
pcall(require, "config/plugins/pounce")
time([[Config for pounce.nvim]], false)
-- Config for: nvim-miniyank
time([[Config for nvim-miniyank]], true)
try_loadstring("\27LJ\2\2Õ\1\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0≠\1    map p <Plug>(miniyank-autoput)\n    map P <Plug>(miniyank-autoPut)\n    map <silent><c-p> <Plug>(miniyank-cycle)\n    map <silent><c-n> <Plug>(miniyank-cycleback)\n    \bcmd\bvim\0", "config", "nvim-miniyank")
time([[Config for nvim-miniyank]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
try_loadstring("\27LJ\2\2Ê\6\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0∆\6    let g:VM_Mono_hl   = 'Visual'\n    let g:VM_Extend_hl = 'WildMenu'\n    let g:VM_Cursor_hl = 'Visual'\n    let g:VM_Insert_hl = 'IncSearch'\n\n    let g:VM_highlight_matches = 'red'\n    let g:VM_leader = '<space>'\n    let g:VM_maps = {}\n    let g:VM_maps['Find Under']         = '<C-d>'\n    let g:VM_maps['Find Subword Under'] = '<C-d>'\n\n    let g:VM_maps['Add Cursor Down']             = '<C-U>'\n    let g:VM_maps['Visual Cursors']              = '<space>'\n    let g:VM_maps['Switch Mode']                 = 'v'\n    let g:VM_maps['Visual Regex']                = '/'\n\n    \" autocmd User visual_multi_start nnoremap <c-l> l\n    \" autocmd User visual_multi_start nnoremap <c-h> h\n    \" autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>\n    \" autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>\n    \bcmd\bvim\0", "config", "vim-visual-multi")
time([[Config for vim-visual-multi]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
require "config.plugins.rust-tools"
time([[Config for rust-tools.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\2|\0\0\3\0\5\0\b6\0\0\0'\1\1\0B\0\2\0029\0\2\0'\1\3\0005\2\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
pcall(require, "config/plugins/pretty-fold")
time([[Config for pretty-fold.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
pcall(require, "config/plugins/gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: workspaces.nvim
time([[Config for workspaces.nvim]], true)
require'workspaces'.setup()
time([[Config for workspaces.nvim]], false)
-- Config for: tabline-framework.nvim
time([[Config for tabline-framework.nvim]], true)
try_loadstring("\27LJ\2\2ü\2\0\0\4\0\15\0\0216\0\0\0009\0\1\0)\1\2\0=\1\2\0006\0\3\0'\1\4\0B\0\2\0029\0\5\0005\1\a\0006\2\3\0'\3\6\0B\2\2\2=\2\b\0015\2\t\0=\2\n\0015\2\v\0=\2\f\0015\2\r\0=\2\14\1B\0\2\1K\0\1\0\fhl_fill\1\0\2\abg\f#000000\afg\f#ffffff\vhl_sel\1\0\2\abg\f#282c34\afg\f#abb2bf\ahl\1\0\2\abg\f#181A1F\afg\f#abb2bf\vrender\1\0\0-tabline_framework.examples.fancy_indexes\nsetup\22tabline_framework\frequire\16showtabline\bopt\bvim\0", "config", "tabline-framework.nvim")
time([[Config for tabline-framework.nvim]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\2ê\3\0\0\a\0\16\0\"6\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\3\a\0'\4\b\0'\5\t\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\n\0'\5\v\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\f\0'\5\r\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\14\0'\5\15\0\18\6\1\0B\2\5\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require 'config.plugins.luasnip'
time([[Config for LuaSnip]], false)
-- Config for: sidebar.nvim
time([[Config for sidebar.nvim]], true)
pcall(require, "config/plugins/sidebar")
time([[Config for sidebar.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd onedark.nvim ]]
vim.cmd [[ packadd indent-blankline.nvim ]]

-- Config for: indent-blankline.nvim
pcall(require, "config/plugins/indent-blankline")

vim.cmd [[ packadd telescope.nvim ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file QuickRun lua require("packer.load")({'vim-quickrun'}, { cmd = "QuickRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WhichKey lua require("packer.load")({'which-key.nvim'}, { cmd = "WhichKey", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dirbuf lua require("packer.load")({'dirbuf.nvim'}, { cmd = "Dirbuf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FZF lua require("packer.load")({'fzf'}, { cmd = "FZF", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <c-\> <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "<lt>c-\\>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'typescript-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/r/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/r/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/r/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
