local M = {}

function M.setup()
  local workspace_path = vim.fn.stdpath("data") .. "/jdtls-workspace/"
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = workspace_path .. project_name
  local mason_path = vim.fn.stdpath("data") .. "/mason/packages"

  local status, jdtls = pcall(require, "jdtls")
  if not status then
    return
  end
  local extendedClientCapabilities = jdtls.extendedClientCapabilities

  local config = {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-javaagent:" .. vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar",
      "-jar",
      vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
      "-configuration",
      vim.fn.stdpath("data") .. "/mason/packages/jdtls/config_linux",
      "-data",
      workspace_dir,
    },
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

    settings = {
      java = {
        configuration = {
          updateBuildConfiguration = "interactive",
        },
        maven = {
          downloadSources = true,
        },
        import = {
          maven = {
            enabled = true,
          },
        },
        signatureHelp = { enabled = true },
        extendedClientCapabilities = extendedClientCapabilities,
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        inlayHints = {
          parameterNames = {
            enabled = "all", -- literals, all, none
          },
        },
        format = {
          enabled = false,
        },
      },
    },

    init_options = {
      bundles = vim.tbl_flatten({
        vim.fn.glob(mason_path .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
        vim.fn.glob(mason_path .. "/java-test/extension/server/*.jar", true),
      }),
    },
  }
  require("jdtls").start_or_attach(config)
  require("jdtls").setup_dap({ hotcodereplace = "auto" })
end

return M
