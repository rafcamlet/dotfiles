" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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
  local success, result = pcall(loadstring(s))
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
    path = "/home/r/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\2ê\3\0\0\a\0\16\0\"6\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\3\a\0'\4\b\0'\5\t\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\n\0'\5\v\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\f\0'\5\r\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\14\0'\5\15\0\18\6\1\0B\2\5\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/Navigator.nvim"
  },
  byline = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/byline"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  fzf = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2ë\v\0\0\4\0\24\0\0276\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2=\2\15\0015\2\16\0005\3\17\0=\3\18\0025\3\19\0=\3\20\2=\2\21\0015\2\22\0=\2\23\1B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\vbuffer\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\t\20update_debounce\3d\29current_line_blame_delay\3Ë\a\vlinehl\1\22use_internal_diff\2\nnumhl\1\18sign_priority\3\6\23current_line_blame\1 current_line_blame_position\beol\23use_decoration_api\2\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  indentLine = {
    config = { "\27LJ\2\2\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0K\0\1\0\28markdown_syntax_conceal\1\5\0\0\b_.*\16NERD_tree.*\amd\tjson\30indentLine_bufNameExclude\6g\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  kommentary = {
    config = { "\27LJ\2\2≠\1\0\0\3\0\a\0\r6\0\0\0'\1\1\0B\0\2\0027\0\2\0006\0\2\0009\0\3\0'\1\4\0005\2\5\0B\0\3\0016\0\2\0009\0\6\0B\0\1\1K\0\1\0\26use_extended_mappings\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\vconfig\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\2Ö\2\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\a\25grey_out_search_area\2)jump_on_partial_input_safety_timeout\3ê\3\24jump_to_first_match\2+match_only_the_start_of_same_char_seqs\2\21limit_ft_matches\3\5\30full_inclusive_prefix_key\n<c-x>\27highlight_unique_chars\1\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lsp-rooter.nvim"] = {
    config = { 'require("lsp-rooter").setup {}' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lsp-rooter.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\2Å\3\0\0\3\0\v\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0'\1\b\0B\0\2\0016\0\6\0009\0\a\0'\1\t\0B\0\2\0016\0\6\0009\0\a\0'\1\n\0B\0\2\1K\0\1\0007inoremap <silent><expr> <c-e> compe#close('<C-e>')8inoremap <silent><expr> <c-k> compe#confirm('<CR>')3inoremap <silent><expr> <c-n> compe#complete()\bcmd\bvim\vsource\1\0\4\vbuffer\2\14ultisnips\2\rnvim_lsp\2\tpath\2\1\0\5\14preselect\venable\15min_length\3\1\fenabled\2\ndebug\1\25allow_prefix_unmatch\1\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\2£\6\0\0\2\0\v\0%6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\0016\0\0\0009\0\1\0'\1\b\0B\0\2\0016\0\0\0009\0\1\0'\1\t\0B\0\2\0016\0\0\0009\0\1\0'\1\n\0B\0\2\1K\0\1\0Bnnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>Cnnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>unnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>mnnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>Jnnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>=nnoremap <silent> <F10> :lua require'dap'.step_out()<CR>=nnoremap <silent> <F9> :lua require'dap'.step_into()<CR>=nnoremap <silent> <F8> :lua require'dap'.step_over()<CR><nnoremap <silent> <F5> :lua require'dap'.continue()<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { 'require("dapui").setup()' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-miniyank"] = {
    config = { "\27LJ\2\2Õ\1\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0≠\1    map p <Plug>(miniyank-autoput)\n    map P <Plug>(miniyank-autoPut)\n    map <silent><c-p> <Plug>(miniyank-cycle)\n    map <silent><c-n> <Plug>(miniyank-cycleback)\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-miniyank"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2™\b\0\0\5\0@\0Ö\0016\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\4\0'\1\5\0B\0\2\0029\0\6\0006\1\0\0009\1\a\1)\2\1\0=\2\b\0016\1\0\0009\1\a\0015\2\v\0\18\3\0\0'\4\n\0B\3\2\2=\3\f\2\18\3\0\0'\4\n\0B\3\2\2=\3\r\2\18\3\0\0'\4\n\0B\3\2\2=\3\14\2\18\3\0\0'\4\15\0B\3\2\2=\3\16\2\18\3\0\0'\4\15\0B\3\2\2=\3\17\2\18\3\0\0'\4\18\0B\3\2\2=\3\19\2\18\3\0\0'\4\20\0B\3\2\2=\3\21\2\18\3\0\0'\4\22\0B\3\2\2=\3\23\2\18\3\0\0'\4\24\0B\3\2\2=\3\25\2\18\3\0\0'\4\26\0B\3\2\2=\3\27\2\18\3\0\0'\4\28\0B\3\2\2=\3\29\2\18\3\0\0'\4\30\0B\3\2\2=\3\31\2\18\3\0\0'\4 \0B\3\2\2=\3!\2\18\3\0\0'\4\"\0B\3\2\2=\3#\2\18\3\0\0'\4$\0B\3\2\2=\3%\2\18\3\0\0'\4&\0B\3\2\2=\3'\2\18\3\0\0'\4(\0B\3\2\2=\3)\2\18\3\0\0'\4*\0B\3\2\2=\3+\2\18\3\0\0'\4,\0B\3\2\2=\3-\2\18\3\0\0'\4.\0B\3\2\2=\3/\2\18\3\0\0'\0040\0B\3\2\2=\0031\2\18\3\0\0'\0042\0B\3\2\2=\0033\2\18\3\0\0'\0044\0B\3\2\2=\0035\2\18\3\0\0'\0046\0B\3\2\2=\0037\2\18\3\0\0'\0048\0B\3\2\2=\0039\2\18\3\0\0'\4:\0B\3\2\2=\3;\2\18\3\0\0'\4<\0B\3\2\2=\3=\2\18\3\0\0'\4>\0B\3\2\2=\3?\2=\2\t\1K\0\1\0\6q\nclose\6u\vdir_up\a]c\18next_git_item\a[c\18prev_git_item\agy\23copy_absolute_path\6Y\14copy_path\6y\14copy_name\6p\npaste\6c\tcopy\n<C-r>\16full_rename\6r\vrename\6d\vremove\6a\vcreate\6R\frefresh\6H\20toggle_dotfiles\6I\19toggle_ignored\n<Tab>\fpreview\6x\15close_node\6>\17next_sibling\6<\17prev_sibling\n<C-t>\vtabnew\n<C-x>\nsplit\n<C-v>\vvsplit\n<C-]>\19<2-RightMouse>\acd\18<2-LeftMouse>\6o\t<CR>\1\0\0\tedit\23nvim_tree_bindings\25nvim_tree_update_cwd\6g\23nvim_tree_callback\21nvim-tree.config\frequire.nnoremap <c-g><c-f> :NvimTreeFindFile<CR>,nnoremap <c-g><c-g> :NvimTreeToggle<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2Û\3\0\0\5\0\18\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\b\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2=\2\t\0015\2\n\0=\2\v\0015\2\f\0004\3\0\0=\3\r\2=\2\14\0015\2\15\0005\3\16\0=\3\5\2=\2\17\1B\0\2\1K\0\1\0\26incremental_selection\1\0\4\19init_selection\agn\21node_decremental\n<c-k>\21node_incremental\n<c-j>\22scope_incremental\n<c-l>\1\0\1\venable\2\14highlight\20custom_captures\1\0\1\venable\2\15playground\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\6\aac\17@class.outer\aaf\20@function.outer\aab\17@block.outer\aif\20@function.inner\aib\17@black.inner\aic\17@class.inner\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { 'vim.cmd "colorscheme onedark"' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { 'require "pears".setup()' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/pears.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\2˝\5\0\0\5\0!\0.5\0\16\0005\1\0\0005\2\1\0=\2\2\0015\2\3\0=\2\4\0015\2\r\0004\3\t\0005\4\5\0>\4\1\0035\4\6\0>\4\2\0035\4\a\0>\4\3\0035\4\b\0>\4\4\0035\4\t\0>\4\5\0035\4\n\0>\4\6\0035\4\v\0>\4\a\0035\4\f\0>\4\b\3=\3\14\2=\2\15\1=\1\17\0005\1\27\0005\2\25\0005\3\19\0005\4\18\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\26\2=\2\28\1=\1\29\0006\1\30\0'\2\31\0B\1\2\0029\1 \1\18\2\0\0B\1\2\1K\0\1\0\nsetup\15rust-tools\frequire\vserver\rsettings\1\0\0\18rust-analyzer\1\0\0\16diagnostics\1\0\2\23enableExperimental\1\venable\1\ncargo\1\0\1\20runBuildScripts\1\16checkOnSave\1\0\0\1\0\1\venable\1\ntools\1\0\0\18hover_actions\vborder\1\0\0\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\16inlay_hints\1\0\a\27parameter_hints_prefix\a<-\26max_len_align_padding\3\1\16right_align\1\23other_hints_prefix\b=> \18max_len_align\1\24right_align_padding\3\a\25show_parameter_hints\2\14runnables\1\0\1\18use_telescope\2\1\0\2\23hover_with_actions\1\17autoSetHints\2\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["simple-wiki.nvim"] = {
    config = { "\27LJ\2\2˝\1\0\0\2\0\b\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0'\1\6\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0B\0\2\1K\0\1\0;nnoremap _ <CMD>lua require \"simple-wiki\".search()<CR>:nnoremap - <CMD>lua require \"simple-wiki\".index()<CR>\bcmd\bvim\1\0\2\21link_key_mapping\agf\tpath\19~/Dropbox/wiki\nsetup\16simple-wiki\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/simple-wiki.nvim"
  },
  ["splitjoin.vim"] = {
    config = { "\27LJ\2\2∑\1\0\0\2\0\5\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0002splitjoin_html_attributes_bracket_on_new_line splitjoin_ruby_hanging_args splitjoin_ruby_curly_braces\6g\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2à\6\0\0\b\0\29\00066\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0005\3\21\0005\4\v\0005\5\t\0005\6\5\0009\a\4\1=\a\6\0069\a\a\1=\a\b\6=\6\n\5=\5\f\0046\5\0\0'\6\r\0B\5\2\0029\5\14\0059\5\15\5=\5\16\0046\5\0\0'\6\r\0B\5\2\0029\5\17\0059\5\15\5=\5\18\0046\5\0\0'\6\r\0B\5\2\0029\5\19\0059\5\15\5=\5\20\4=\4\22\3B\2\2\0016\2\23\0009\2\24\2'\3\25\0B\2\2\0016\2\23\0009\2\24\2'\3\26\0B\2\2\0016\2\23\0009\2\24\2'\3\27\0B\2\2\0016\2\23\0009\2\24\2'\3\28\0B\2\2\1K\0\1\0Mnnoremap <space>ot <cmd>lua require(\"telescope.builtin\").help_tags()<cr>Knnoremap <space>ob <cmd>lua require(\"telescope.builtin\").buffers()<cr>Mnnoremap <space>of <cmd>lua require(\"telescope.builtin\").live_grep()<cr>Nnnoremap <space>oo <cmd>lua require(\"telescope.builtin\").find_files()<cr>\bcmd\bvim\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\rmappings\1\0\0\6i\1\0\0\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    config = { "\27LJ\2\2…\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\rvertical\23UltiSnipsEditSplit\n<C-k>!UltiSnipsJumpBackwardTrigger UltiSnipsJumpForwardTrigger\n<C-j>\27UltiSnipsExpandTrigger\6g\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\2\2Ê\6\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0∆\6    let g:VM_Mono_hl   = 'Visual'\n    let g:VM_Extend_hl = 'WildMenu'\n    let g:VM_Cursor_hl = 'Visual'\n    let g:VM_Insert_hl = 'IncSearch'\n\n    let g:VM_highlight_matches = 'red'\n    let g:VM_leader = '<space>'\n    let g:VM_maps = {}\n    let g:VM_maps['Find Under']         = '<C-d>'\n    let g:VM_maps['Find Subword Under'] = '<C-d>'\n\n    let g:VM_maps['Add Cursor Down']             = '<C-U>'\n    let g:VM_maps['Visual Cursors']              = '<space>'\n    let g:VM_maps['Switch Mode']                 = 'v'\n    let g:VM_maps['Visual Regex']                = '/'\n\n    \" autocmd User visual_multi_start nnoremap <c-l> l\n    \" autocmd User visual_multi_start nnoremap <c-h> h\n    \" autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>\n    \" autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2Û\3\0\0\5\0\18\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\b\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2=\2\t\0015\2\n\0=\2\v\0015\2\f\0004\3\0\0=\3\r\2=\2\14\0015\2\15\0005\3\16\0=\3\5\2=\2\17\1B\0\2\1K\0\1\0\26incremental_selection\1\0\4\19init_selection\agn\21node_decremental\n<c-k>\21node_incremental\n<c-j>\22scope_incremental\n<c-l>\1\0\1\venable\2\14highlight\20custom_captures\1\0\1\venable\2\15playground\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\6\aac\17@class.outer\aaf\20@function.outer\aab\17@block.outer\aif\20@function.inner\aib\17@black.inner\aic\17@class.inner\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indentLine
time([[Config for indentLine]], true)
try_loadstring("\27LJ\2\2\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0K\0\1\0\28markdown_syntax_conceal\1\5\0\0\b_.*\16NERD_tree.*\amd\tjson\30indentLine_bufNameExclude\6g\bvim\0", "config", "indentLine")
time([[Config for indentLine]], false)
-- Config for: simple-wiki.nvim
time([[Config for simple-wiki.nvim]], true)
try_loadstring("\27LJ\2\2˝\1\0\0\2\0\b\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0'\1\6\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0B\0\2\1K\0\1\0;nnoremap _ <CMD>lua require \"simple-wiki\".search()<CR>:nnoremap - <CMD>lua require \"simple-wiki\".index()<CR>\bcmd\bvim\1\0\2\21link_key_mapping\agf\tpath\19~/Dropbox/wiki\nsetup\16simple-wiki\frequire\0", "config", "simple-wiki.nvim")
time([[Config for simple-wiki.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\2£\6\0\0\2\0\v\0%6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\0016\0\0\0009\0\1\0'\1\b\0B\0\2\0016\0\0\0009\0\1\0'\1\t\0B\0\2\0016\0\0\0009\0\1\0'\1\n\0B\0\2\1K\0\1\0Bnnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>Cnnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>unnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>mnnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>Jnnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>=nnoremap <silent> <F10> :lua require'dap'.step_out()<CR>=nnoremap <silent> <F9> :lua require'dap'.step_into()<CR>=nnoremap <silent> <F8> :lua require'dap'.step_over()<CR><nnoremap <silent> <F5> :lua require'dap'.continue()<CR>\bcmd\bvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\2≠\1\0\0\3\0\a\0\r6\0\0\0'\1\1\0B\0\2\0027\0\2\0006\0\2\0009\0\3\0'\1\4\0005\2\5\0B\0\3\0016\0\2\0009\0\6\0B\0\1\1K\0\1\0\26use_extended_mappings\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\vconfig\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
vim.cmd "colorscheme onedark"
time([[Config for onedark.nvim]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\2…\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\rvertical\23UltiSnipsEditSplit\n<C-k>!UltiSnipsJumpBackwardTrigger UltiSnipsJumpForwardTrigger\n<C-j>\27UltiSnipsExpandTrigger\6g\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2à\6\0\0\b\0\29\00066\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0005\3\21\0005\4\v\0005\5\t\0005\6\5\0009\a\4\1=\a\6\0069\a\a\1=\a\b\6=\6\n\5=\5\f\0046\5\0\0'\6\r\0B\5\2\0029\5\14\0059\5\15\5=\5\16\0046\5\0\0'\6\r\0B\5\2\0029\5\17\0059\5\15\5=\5\18\0046\5\0\0'\6\r\0B\5\2\0029\5\19\0059\5\15\5=\5\20\4=\4\22\3B\2\2\0016\2\23\0009\2\24\2'\3\25\0B\2\2\0016\2\23\0009\2\24\2'\3\26\0B\2\2\0016\2\23\0009\2\24\2'\3\27\0B\2\2\0016\2\23\0009\2\24\2'\3\28\0B\2\2\1K\0\1\0Mnnoremap <space>ot <cmd>lua require(\"telescope.builtin\").help_tags()<cr>Knnoremap <space>ob <cmd>lua require(\"telescope.builtin\").buffers()<cr>Mnnoremap <space>of <cmd>lua require(\"telescope.builtin\").live_grep()<cr>Nnnoremap <space>oo <cmd>lua require(\"telescope.builtin\").find_files()<cr>\bcmd\bvim\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\rmappings\1\0\0\6i\1\0\0\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
try_loadstring("\27LJ\2\2∑\1\0\0\2\0\5\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0002splitjoin_html_attributes_bracket_on_new_line splitjoin_ruby_hanging_args splitjoin_ruby_curly_braces\6g\bvim\0", "config", "splitjoin.vim")
time([[Config for splitjoin.vim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2™\b\0\0\5\0@\0Ö\0016\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\4\0'\1\5\0B\0\2\0029\0\6\0006\1\0\0009\1\a\1)\2\1\0=\2\b\0016\1\0\0009\1\a\0015\2\v\0\18\3\0\0'\4\n\0B\3\2\2=\3\f\2\18\3\0\0'\4\n\0B\3\2\2=\3\r\2\18\3\0\0'\4\n\0B\3\2\2=\3\14\2\18\3\0\0'\4\15\0B\3\2\2=\3\16\2\18\3\0\0'\4\15\0B\3\2\2=\3\17\2\18\3\0\0'\4\18\0B\3\2\2=\3\19\2\18\3\0\0'\4\20\0B\3\2\2=\3\21\2\18\3\0\0'\4\22\0B\3\2\2=\3\23\2\18\3\0\0'\4\24\0B\3\2\2=\3\25\2\18\3\0\0'\4\26\0B\3\2\2=\3\27\2\18\3\0\0'\4\28\0B\3\2\2=\3\29\2\18\3\0\0'\4\30\0B\3\2\2=\3\31\2\18\3\0\0'\4 \0B\3\2\2=\3!\2\18\3\0\0'\4\"\0B\3\2\2=\3#\2\18\3\0\0'\4$\0B\3\2\2=\3%\2\18\3\0\0'\4&\0B\3\2\2=\3'\2\18\3\0\0'\4(\0B\3\2\2=\3)\2\18\3\0\0'\4*\0B\3\2\2=\3+\2\18\3\0\0'\4,\0B\3\2\2=\3-\2\18\3\0\0'\4.\0B\3\2\2=\3/\2\18\3\0\0'\0040\0B\3\2\2=\0031\2\18\3\0\0'\0042\0B\3\2\2=\0033\2\18\3\0\0'\0044\0B\3\2\2=\0035\2\18\3\0\0'\0046\0B\3\2\2=\0037\2\18\3\0\0'\0048\0B\3\2\2=\0039\2\18\3\0\0'\4:\0B\3\2\2=\3;\2\18\3\0\0'\4<\0B\3\2\2=\3=\2\18\3\0\0'\4>\0B\3\2\2=\3?\2=\2\t\1K\0\1\0\6q\nclose\6u\vdir_up\a]c\18next_git_item\a[c\18prev_git_item\agy\23copy_absolute_path\6Y\14copy_path\6y\14copy_name\6p\npaste\6c\tcopy\n<C-r>\16full_rename\6r\vrename\6d\vremove\6a\vcreate\6R\frefresh\6H\20toggle_dotfiles\6I\19toggle_ignored\n<Tab>\fpreview\6x\15close_node\6>\17next_sibling\6<\17prev_sibling\n<C-t>\vtabnew\n<C-x>\nsplit\n<C-v>\vvsplit\n<C-]>\19<2-RightMouse>\acd\18<2-LeftMouse>\6o\t<CR>\1\0\0\tedit\23nvim_tree_bindings\25nvim_tree_update_cwd\6g\23nvim_tree_callback\21nvim-tree.config\frequire.nnoremap <c-g><c-f> :NvimTreeFindFile<CR>,nnoremap <c-g><c-g> :NvimTreeToggle<CR>\bcmd\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lsp-rooter.nvim
time([[Config for lsp-rooter.nvim]], true)
require("lsp-rooter").setup {}
time([[Config for lsp-rooter.nvim]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
try_loadstring("\27LJ\2\2Ê\6\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0∆\6    let g:VM_Mono_hl   = 'Visual'\n    let g:VM_Extend_hl = 'WildMenu'\n    let g:VM_Cursor_hl = 'Visual'\n    let g:VM_Insert_hl = 'IncSearch'\n\n    let g:VM_highlight_matches = 'red'\n    let g:VM_leader = '<space>'\n    let g:VM_maps = {}\n    let g:VM_maps['Find Under']         = '<C-d>'\n    let g:VM_maps['Find Subword Under'] = '<C-d>'\n\n    let g:VM_maps['Add Cursor Down']             = '<C-U>'\n    let g:VM_maps['Visual Cursors']              = '<space>'\n    let g:VM_maps['Switch Mode']                 = 'v'\n    let g:VM_maps['Visual Regex']                = '/'\n\n    \" autocmd User visual_multi_start nnoremap <c-l> l\n    \" autocmd User visual_multi_start nnoremap <c-h> h\n    \" autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>\n    \" autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>\n    \bcmd\bvim\0", "config", "vim-visual-multi")
time([[Config for vim-visual-multi]], false)
-- Config for: nvim-miniyank
time([[Config for nvim-miniyank]], true)
try_loadstring("\27LJ\2\2Õ\1\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0≠\1    map p <Plug>(miniyank-autoput)\n    map P <Plug>(miniyank-autoPut)\n    map <silent><c-p> <Plug>(miniyank-cycle)\n    map <silent><c-n> <Plug>(miniyank-cycleback)\n    \bcmd\bvim\0", "config", "nvim-miniyank")
time([[Config for nvim-miniyank]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\2˝\5\0\0\5\0!\0.5\0\16\0005\1\0\0005\2\1\0=\2\2\0015\2\3\0=\2\4\0015\2\r\0004\3\t\0005\4\5\0>\4\1\0035\4\6\0>\4\2\0035\4\a\0>\4\3\0035\4\b\0>\4\4\0035\4\t\0>\4\5\0035\4\n\0>\4\6\0035\4\v\0>\4\a\0035\4\f\0>\4\b\3=\3\14\2=\2\15\1=\1\17\0005\1\27\0005\2\25\0005\3\19\0005\4\18\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\26\2=\2\28\1=\1\29\0006\1\30\0'\2\31\0B\1\2\0029\1 \1\18\2\0\0B\1\2\1K\0\1\0\nsetup\15rust-tools\frequire\vserver\rsettings\1\0\0\18rust-analyzer\1\0\0\16diagnostics\1\0\2\23enableExperimental\1\venable\1\ncargo\1\0\1\20runBuildScripts\1\16checkOnSave\1\0\0\1\0\1\venable\1\ntools\1\0\0\18hover_actions\vborder\1\0\0\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\16inlay_hints\1\0\a\27parameter_hints_prefix\a<-\26max_len_align_padding\3\1\16right_align\1\23other_hints_prefix\b=> \18max_len_align\1\24right_align_padding\3\a\25show_parameter_hints\2\14runnables\1\0\1\18use_telescope\2\1\0\2\23hover_with_actions\1\17autoSetHints\2\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\2Å\3\0\0\3\0\v\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0'\1\b\0B\0\2\0016\0\6\0009\0\a\0'\1\t\0B\0\2\0016\0\6\0009\0\a\0'\1\n\0B\0\2\1K\0\1\0007inoremap <silent><expr> <c-e> compe#close('<C-e>')8inoremap <silent><expr> <c-k> compe#confirm('<CR>')3inoremap <silent><expr> <c-n> compe#complete()\bcmd\bvim\vsource\1\0\4\vbuffer\2\14ultisnips\2\rnvim_lsp\2\tpath\2\1\0\5\14preselect\venable\15min_length\3\1\fenabled\2\ndebug\1\25allow_prefix_unmatch\1\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2ë\v\0\0\4\0\24\0\0276\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2=\2\15\0015\2\16\0005\3\17\0=\3\18\0025\3\19\0=\3\20\2=\2\21\0015\2\22\0=\2\23\1B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\vbuffer\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\t\20update_debounce\3d\29current_line_blame_delay\3Ë\a\vlinehl\1\22use_internal_diff\2\nnumhl\1\18sign_priority\3\6\23current_line_blame\1 current_line_blame_position\beol\23use_decoration_api\2\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: pears.nvim
time([[Config for pears.nvim]], true)
require "pears".setup()
time([[Config for pears.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
require("dapui").setup()
time([[Config for nvim-dap-ui]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\2ê\3\0\0\a\0\16\0\"6\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\3\a\0'\4\b\0'\5\t\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\n\0'\5\v\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\f\0'\5\r\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\14\0'\5\15\0\18\6\1\0B\2\5\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\2Ö\2\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\a\25grey_out_search_area\2)jump_on_partial_input_safety_timeout\3ê\3\24jump_to_first_match\2+match_only_the_start_of_same_char_seqs\2\21limit_ft_matches\3\5\30full_inclusive_prefix_key\n<c-x>\27highlight_unique_chars\1\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: nvim-lspinstall
time([[Config for nvim-lspinstall]], true)

time([[Config for nvim-lspinstall]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
