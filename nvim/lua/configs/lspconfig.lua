require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- C/C++

vim.lsp.config("clangd", {
  cmd = { "clangd" },
})

vim.lsp.enable("clangd")

-- JAVA

local lombok = vim.fn.expand("~/.local/share/nvim/java/lombok.jar")

local launcher = vim.fn.glob(
  "~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
)

local config = vim.fn.expand(
  "~/.local/share/nvim/mason/packages/jdtls/config_linux"
)

local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/" ..
  vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

vim.lsp.config("jdtls", {
  cmd = {
    "java",

    "-javaagent:" .. lombok,

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",

    "-Xmx2g",

    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    launcher,

    "-configuration",
    config,

    "-data",
    workspace,
  },

  settings = {
    java = {},
  },
})

vim.lsp.enable("jdtls")

vim.lsp.enable("vscode-spring-boot-tools")

-- read :h vim.lsp.config for changing options of lsp servers
