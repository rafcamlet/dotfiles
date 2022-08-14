vim.cmd("nnoremap <c-g><c-g> :NvimTreeToggle<CR>")
vim.cmd("nnoremap <c-g><c-f> :NvimTreeFindFile<CR>")

local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.cmd "let g:nvim_tree_add_trailing = 1"
vim.cmd "let g:nvim_tree_disable_window_picker = 1"
vim.cmd "let g:nvim_tree_respect_buf_cwd = 1"

require'nvim-tree'.setup {
  update_cwd = true,
  hijack_cursor = false,
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    mappings = {
      list = {
        { key = "<CR>", cb = tree_cb("edit") },
        { key = "o", cb = tree_cb("edit") },
        { key = "<2-LeftMouse>", cb = tree_cb("edit") },
        { key = "<2-RightMouse>", cb = tree_cb("cd") },
        { key = "<C-]>", cb = tree_cb("cd") },
        { key = "<C-v>", cb = tree_cb("vsplit") },
        { key = "<C-x>", cb = tree_cb("split") },
        { key = "<c-t>", cb = tree_cb("tabnew") },
        { key = "<", cb = tree_cb("prev_sibling") },
        { key = ">", cb = tree_cb("next_sibling") },
        { key = "<s-cr>", cb = tree_cb("close_node") },
        { key = "<Tab>", cb = tree_cb("preview") },
        { key = "I", cb = tree_cb("toggle_ignored") },
        { key = "H", cb = tree_cb("toggle_dotfiles") },
        { key = "R", cb = tree_cb("refresh") },
        { key = "a", cb = tree_cb("create") },
        { key = "d", cb = tree_cb("remove") },
        { key = "r", cb = tree_cb("rename") },
        { key = "<C-r>", cb = tree_cb("full_rename") },
        { key = "x", cb = tree_cb("cut")},
        { key = "c", cb = tree_cb("copy") },
        { key = "p", cb = tree_cb("paste") },
        { key = "y", cb = tree_cb("copy_name") },
        { key = "Y", cb = tree_cb("copy_path") },
        { key = "gy", cb = tree_cb("copy_absolute_path") },
        { key = "[c", cb = tree_cb("prev_git_item") },
        { key = "]c", cb = tree_cb("next_git_item") },
        { key = "u", cb = tree_cb("dir_up") },
        { key = "q", cb = tree_cb("close") },
      }
    }
  }
}
