-- local log = require("vim/lsp/log")
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local lsp_status = require("lsp-status")
local lsp_python = require("lsp_python")
local diagnosticls = require("diagnosticls")

local function on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  local function buf_get_option(...)
    vim.api.nvim_buf_get_option(bufnr, ...)
  end

  local filetype = buf_get_option("filetype")

  local keymaps = {
    -- { "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>" },
    { "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
    { "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
    -- { "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
    { "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
    { "n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>" },
    { "n", "[I", "<cmd>lua vim.lsp.buf.references()<CR>" },
    { "n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<CR>" },
    { "n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>" },
    { "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
    { "n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" },
    { "n", "[g", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" },
    { "n", "]g", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
  }

  if not vim.tbl_contains({ "c", "vim" }, filetype) then
    table.insert(keymaps, { "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>" })
  end

  for _, keymap in pairs(keymaps) do
    local mode, lhs, rhs = unpack(keymap)
    buf_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
  end

  -- Snippets.
  for _, keymap in pairs({
    { "i", "<C-j>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'" },
    { "s", "<C-j>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'" },
  }) do
    local mode, lhs, rhs = unpack(keymap)
    buf_set_keymap(mode, lhs, rhs, { expr = true })
  end

  -- Completion.
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  -- buf_set_option("completeopt", "menuone,noinsert,noselect")

  -- Statusline.
  lsp_status.on_attach(client)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_format
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 5000)
      augroup END
    ]],
      false
    )
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end

  vim.cmd(
    "autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics(focusable=false)"
  )
end

lsp_status.config({
  diagnostics = false,
  status_symbol = "",
})
lsp_status.register_progress()

if not lspconfig.mypy_ls then
  local configs = require("lspconfig/configs")
  configs.mypy_ls = {
    default_config = {
      cmd = { "node", "/Users/peter/Workspace/lithammer/mypy-ls/dist/index.js", "--stdio" },
      -- cmd = { "mypy-ls", "--stdio" },
      filetypes = { "python" },
      root_dir = function(fname)
        return util.root_pattern("mypy.ini", ".mypy.ini", "setup.cfg")(fname)
          or util.find_git_ancestor(fname)
          or util.path.dirname(fname)
      end,
      settings = {},
    },
  }
end

local enabled_servers = {
  ansiblels = {},
  bashls = {},
  clangd = {
    init_options = {
      clangdFileStatus = true,
      completeUnimported = true,
      usePlaceholders = true,
    },
    handlers = lsp_status.extensions.clangd.setup(),
    settings = {
      clangd = {
        disableSnippetCompletion = false,
      },
    },
  },
  cmake = {},
  cssls = {},
  diagnosticls = {
    filetypes = diagnosticls.filetypes,
    init_options = {
      linters = diagnosticls.linters,
      formatters = diagnosticls.formatters,
      filetypes = {
        lua = { "luacheck", "selene" },
        markdown = { "markdownlint" },
        python = {
          "flake8",
          "mypy",
          -- "dmypy",
        },
        scss = "stylelint",
        sh = "shellcheck",
        vim = "vint",
        yaml = "yamllint",
        ["yaml.ansible"] = { "yamllint", "ansible-lint" },
      },
      formatFiletypes = {
        fish = "fish_indent",
        javascript = "prettier",
        javascriptreact = "prettier",
        json = "prettier",
        lua = { "lua-format", "stylua" },
        python = { "isort", "black" },
        sh = "shfmt",
        sql = "pg_format",
        typescript = "prettier",
        typescriptreact = "prettier",
      },
    },
  },
  dockerls = {},
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
        usePlaceholders = true,
      },
    },
  },
  groovyls = {
    cmd = { "groovy-language-server" },
    filetypes = { "groovy", "Jenkinsfile" },
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
  },
  html = {},
  jsonls = {},
  -- mypy_ls = {},
  nimls = {},
  ocamllsp = {
    cmd = { "opam", "config", "exec", "--", "ocamllsp" },
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          useLibraryCodeForTypes = true,
        },
      },
    },
    root_dir = lsp_python.root_uri,
    before_init = function(_, config)
      config.settings.python.pythonPath = lsp_python.python_path(config.root_dir)
    end,
    handlers = {
      ["textDocument/publishDiagnostics"] = function() end,
    },
  },
  rome = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        completion = {
          addCallArgumentSnippets = true,
          addCallParenthesis = true,
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
  scry = {
    cmd = { "crystalline" },
  },
  solargraph = {
    cmd = { "/usr/local/lib/ruby/gems/3.0.0/bin/solargraph", "stdio" },
    root_dir = function(fname)
      return util.root_pattern("Gemfile")(fname)
        or util.find_git_ancestor(fname)
        or util.path.dirname(fname)
    end,
  },
  sourcekit = {
    root_dir = function(fname)
      return util.root_pattern("Package.swift", "*.xcodeproj")(fname)
        or util.find_git_ancestor(fname)
        or util.path.dirname(fname)
    end,
  },
  sumneko_lua = {
    cmd = { "lua-language-server" },
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          disable = {
            "undefined-global",
          },
          --   globals = {
          --     "vim", "describe", "it", "before_each", "after_each"
          --   },
        },
        runtime = {
          version = "LuaJIT",
        },
      },
    },
  },
  terraformls = {},
  tsserver = {},
  vimls = {},
  yamlls = {
    settings = {
      yaml = {
        format = { enable = true },
        schemaStore = { enable = true },
      },
    },
  },
  zls = {},
}
vim.lsp.set_log_level(vim.lsp.log_levels.INFO)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local default_config = {
  capabilities = capabilities,
  log_level = vim.lsp.protocol.MessageType.Log,
  message_level = vim.lsp.protocol.MessageType.Log,
  on_attach = on_attach,
  flags = {
    allow_incremental_sync = true, -- https://github.com/neovim/neovim/pull/14079
    debounce_text_changes = 80, -- https://github.com/neovim/neovim/pull/14119
  },
  -- on_init = function(client)
  --   -- https://github.com/neovim/neovim/pull/14079
  --   client.config.flags.allow_incremental_sync = true
  --   -- https://github.com/neovim/neovim/pull/14119
  --   client.config.flags.debounce_text_changes = 80
  -- end,
}

for server, config in pairs(enabled_servers) do
  config = vim.tbl_deep_extend("force", default_config, config)
  lspconfig[server].setup(config)
end
