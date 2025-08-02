return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    mason_lspconfig.setup({
      -- list of servers to install
      ensure_installed = {
        "gopls",                  -- go
        "harper_ls",              -- Spelling
        "pyright",                --python
        "jdtls",                  --java
        "lua_ls",                 --lua
        "eslint",                 -- eslint
        "ts_ls",                  -- Javascript and Typescript
        "clangd",                 -- C & C++
        "cmake",                  -- cmake
        "cssls",                  -- CSS, SCSS & LESS
        "bashls",                 -- Bash, Csh, Ksh, Sh, Zsh
        "gh_actions_ls",          -- Github Actions (YAML)
        "jsonls",                 -- JSON
        "kotlin_language_server", -- Kotlin
        -- Linux config langs
        "hyprls",                 -- hyprland config
        -- "nil_ls", -- Nix (use if you are using the nix package manager or nixOS)
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- Web extensions
        "isort",    -- Python
        "black",    -- Python
      }
    })
  end,
}
