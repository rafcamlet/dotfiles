local wk = require("which-key")

wk.setup {
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20
    }
  },
  ignore_missing = true,
  triggers = { 'z', '<leader>' },
}
