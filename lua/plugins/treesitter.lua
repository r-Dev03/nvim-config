return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "MeanderingProgrammer/treesitter-modules.nvim",
    },
    config = function()
      local languages = {
        "angular",
        "bash",
        "c",
        "go",
        "gitignore",
        "cpp",
        "css",
        "html",
        "hyprlang",
        "javascript",
        "java",
        "lua",
        "markdown",
        "markdown_inline",
        "matlab",
        "nix",
        "python",
        "rust",
        "scss",
        "typescript",
        "dart",
        "toml",
        "tsx",
        "typst",
        "vim",
        "vimdoc",
      }

      local ts = require("treesitter-modules")
      ts.setup({
        ensure_installed = languages,
        ignore_install = { "latex" },
        sync_install = false,
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.opt.foldenable = false
    end,
  },
}
