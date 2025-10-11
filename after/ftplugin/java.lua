vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.expandtab = true
vim.bo.softtabstop = 2
vim.cmd.compiler("javac")
vim.bo.makeprg = "javac %:p"

local jdtls = require('jdtls')

-- 1) Resolve project root via common Java markers
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == "" then
  return
end

local jdtls_bin = vim.fn.exepath("jdtls")
local workspace_dir = vim.fn.stdpath("data") ..
  "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")


local caps = vim.lsp.protocol.make_client_capabilities()
caps.textDocument.completion.completionItem.snippetSupport = true
require('jdtls').start_or_attach({
  cmd = { 'jdtls', '-data', workspace_dir },
  root_dir = root_dir,
  capabilities = caps,
})


-- 4) Start or attach
jdtls.start_or_attach({
  cmd = { jdtls_bin, "-data", workspace_dir },
  root_dir = root_dir,
  capabilities = capabilities,
  settings = {
    java = {
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      configuration = { updateBuildConfiguration = "interactive" },
      signatureHelp = { enabled = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
    },
  },
  init_options = { bundles = {} }, -- fill for debug/test if desired
})


