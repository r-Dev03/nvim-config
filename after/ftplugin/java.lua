vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.expandtab = true
vim.bo.softtabstop = 2
vim.cmd.compiler("javac")
vim.bo.makeprg = "javac %:p"

-- Format options → See [ :h 'formatoptions' ]
vim.opt.formatoptions = vim.opt.formatoptions
  - "t" -- No autoformatting based on `textwidth`
  - "a" -- No autoformatting, AGAIN.
  - "o" -- o / O do not continue comments if launched from within them.
  - "2" -- Not in gradeschool ;)
  + "r" -- But Enter in Insertmode does.
  + "n" -- Do recognize numbered lists.
  + "c" -- But I do like when comments respect textwidth :D
  + "j" -- Autoremove comments if possible.

local home = os.getenv("HOME")
local capabilities = require("plugins.lspconfig").capabilities

local config = {
  capabilities = capabilities,
  cmd = { home .. "/.nix-profile/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    java = {
      configuration = { updateBuildConfiguration = "interactive" },
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = { enabled = false },
      signatureHelp = { enabled = true },
    },
  },
  init_options = {
    bundles = {
      ---@diagnostic disable-next-line: param-type-mismatch
      -- vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 0),
    },
  },
}

require("jdtls").start_or_attach(config)
