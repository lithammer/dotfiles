local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  -- indent = {
  --   enable = true,
  -- },
  -- refactor = {
  --   highlight_definitions = {
  --     enable = true
  --   },
  --   highlight_current_scope = {
  --     enable = true
  --   },
  -- }
})
