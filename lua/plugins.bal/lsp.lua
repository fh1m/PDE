-- linting format
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
  signs = false,
  update_in_insert = false,
  float = {
    source = 'always',
    border = 'single',
  },
})

-- Menu Icons
require('lspkind').init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰮ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "渚",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
    },
})

-- Lsp Code Location
local navic = require("nvim-navic")
navic.setup {
  icons = {
    File          = "  ",
    Module        = "  ",
    Namespace     = "  ",
    Package       = "  ",
    Class         = "  ",
    Method        = "  ",
    Property      = "  ",
    Field         = "  ",
    Constructor   = "  ",
    Enum          = " 練",
    Interface     = " 練",
    Function      = "  ",
    Variable      = "  ",
    Constant      = "  ",
    String        = "  ",
    Number        = "  ",
    Boolean       = " ◩ ",
    Array         = "  ",
    Object        = "  ",
    Key           = "  ",
    Null          = " ﳠ ",
    EnumMember    = "  ",
    Struct        = "  ",
    Event         = "  ",
    Operator      = "  ",
    TypeParameter = "  ",
  },
  highlight = false,
  separator = "  ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}

-- Border for Documentation
local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- LSP Snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.offsetEncoding = { "utf-16" }
-- use | capabilities = capabilities | to use snippet from lsp

-- Python
require("lspconfig").pyright.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

require("lspconfig").clangd.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    require("nvim-navic").attach(client, bufnr)
  end
}

-- latex
require 'lspconfig'.texlab.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

-- Arduino
require 'lspconfig'.arduino_language_server.setup({
  cmd = {
    -- Required
    "arduino-language-server",
    "-cli-config", "/home/fh1m/.arduino15/arduino-cli.yaml",
    -- Optional
    "-cli", "/usr/bin/arduino-cli",
    "-clangd", "/usr/bin/clangd"
  },

  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
})

-- Bash
require 'lspconfig'.bashls.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client)
      require 'illuminate'.on_attach(client)
    end,
}

-- Go
require 'lspconfig'.gopls.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

-- Haskell
require 'lspconfig'.hls.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

-- Rust
require 'lspconfig'.rust_analyzer.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

-- typescript and javascript
require 'lspconfig'.tsserver.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

-- Javascript
require 'lspconfig'.eslint.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
  end
}

-- Markdown
require 'lspconfig'.grammarly.setup {
  handlers = handlers,
  capabilities = capabilities,
}

-- Html
require 'lspconfig'.html.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client)
      require 'illuminate'.on_attach(client)
    end,
}

-- CSS
require 'lspconfig'.cssls.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client)
      require 'illuminate'.on_attach(client)
    end,
}

-- JSON
require 'lspconfig'.jsonls.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

-- Lua
require 'lspconfig'.sumneko_lua.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

-- Vim
require 'lspconfig'.vimls.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}

-- SQL
require 'lspconfig'.sqlls.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
  end
}

-- emmet
require 'lspconfig'.emmet_ls.setup {
  handlers = handlers,
  capabilities = capabilities,
}

-- Markdown
require 'lspconfig'.marksman.setup {
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)
    navic.attach(client, bufnr)
  end
}
