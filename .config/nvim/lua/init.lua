local luasnip = require("luasnip")

local o = vim.o

-- norcalli/nvim-colorizer.lua
require("colorizer").setup({
  "colortemplate",
  "conf",
  css = { css = true },
  "javascript",
  "less",
  "scss",
  "typescript",
})

require("zen-mode").setup({
  plugins = {
    gitsigns = true,
    tmux = true,
    kitty = {
      enabled = true,
      font = "+2",
    },
  },
})

require("cmp").setup({
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-b>"] = cmp.mapping.scroll_docs(4),
    -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})

o.completeopt = "menuone,noselect"

require("treesitter")
require("lsp")

-- vim.api.nvim_set_option("foldmethod", "expr")
-- vim.api.nvim_set_option("foldexpr", "nvim_treesitter#foldexpr()")
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
