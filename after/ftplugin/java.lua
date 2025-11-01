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

local lombok_path = vim.fn.glob(root_dir .. "/target/dependency/lombok*.jar")
local cmd = { "jdtls" }

if vim.fn.filereadable(lombok_path) == 1 then
  table.insert(cmd, "--jvm-arg=-javaagent:" .. lombok_path)
else
  vim.notify("⚠️ Lombok JAR not found in target/dependency, skipping javaagent", vim.log.levels.WARN)
end

table.insert(cmd, "-data")
table.insert(cmd, workspace_dir)

local caps = vim.lsp.protocol.make_client_capabilities()
caps.textDocument.completion.completionItem.snippetSupport = true

jdtls.start_or_attach({
  cmd = cmd,
  root_dir = root_dir,
  capabilities = caps,
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
  init_options = { bundles = {} },
})

