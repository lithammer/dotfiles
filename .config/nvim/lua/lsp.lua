-- local log = require("vim/lsp/log")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local diagnosticls = require("diagnosticls")
local lsp_python = require("lsp_python")
local lsp_status = require("lsp-status")
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local function on_attach(client, bufnr)
  -- Plugins.
  lsp_status.on_attach(client)

  local keymaps = {
    -- { "n", "K", vim.lsp.buf.hover },
    { "n", "gd", vim.lsp.buf.definition },
    { "n", "gD", vim.lsp.buf.declaration },
    -- { "n", "gI", vim.lsp.buf.implementation },
    { "n", "<C-k>", vim.lsp.buf.signature_help },
    { "n", "gr", vim.lsp.buf.rename },
    { "n", "[I", vim.lsp.buf.references },
    { "n", "gO", vim.lsp.buf.document_symbol },
    { "n", "gW", vim.lsp.buf.workspace_symbol },
    { "n", "ga", vim.lsp.buf.code_action },
    { "n", "<leader>e", vim.diagnostic.open_float },
    { "n", "<leader>f", vim.lsp.buf.formatting_seq_sync },
    { "n", "[g", vim.diagnostic.goto_prev },
    { "n", "]g", vim.diagnostic.goto_next },
  }

  if not vim.tbl_contains({ "c", "vim" }, vim.bo.filetype) then
    table.insert(keymaps, { "n", "K", vim.lsp.buf.hover })
  end

  for _, keymap in pairs(keymaps) do
    local mode, lhs, rhs = unpack(keymap)
    local opts = { buffer = true, noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Snippets.
  vim.keymap.set(
    { "i", "s" },
    "<C-j>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'",
    { expr = true }
  )

  -- Completion.
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.go.completeopt = "menuone,noinsert,noselect"

  if client.server_capabilities.documentFormattingProvider then
    local lsp_document_format = vim.api.nvim_create_augroup(
      "lsp_document_format",
      { clear = false }
    )
    vim.api.nvim_create_autocmd(
      "BufWritePre", {
        callback = vim.lsp.buf.formatting_seq_sync,
        buffer = bufnr,
        group = lsp_document_format,
      })
  end

  if client.server_capabilities.documentHighlightProvider then
    local lsp_document_highlight = vim.api.nvim_create_augroup(
      "lsp_document_highlight",
      { clear = false }
    )
    vim.api.nvim_create_autocmd(
      "CursorHold", {
        callback = vim.lsp.buf.document_highlight,
        buffer = bufnr,
        group = lsp_document_highlight,
      })
    vim.api.nvim_create_autocmd(
      "CursorMoved", {
        callback = vim.lsp.buf.clear_references,
        buffer = bufnr,
        group = lsp_document_highlight,
      })
  end

  vim.api.nvim_create_autocmd(
    "CursorHold", {
      callback = vim.diagnostic.open_float,
      buffer = bufnr
    })
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
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local default_config = {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

for server, config in pairs(enabled_servers) do
  config = vim.tbl_deep_extend("force", default_config, config)
  lspconfig[server].setup(config)
end
