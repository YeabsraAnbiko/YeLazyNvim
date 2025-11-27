return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local mason_registry_ok, mason_registry = pcall(require, "mason-registry")
      if not mason_registry_ok then
        vim.notify("Mason registry not available", vim.log.levels.ERROR)
        return
      end

      -- Find JDTLS package path safely
      local ok, pkg = pcall(mason_registry.get_package, "jdtls")
      if not ok or not pkg then
        vim.notify("JDTLS not found. Run :MasonInstall jdtls", vim.log.levels.WARN)
        return
      end

      -- Mason stores packages under mason_path/packages/<name>
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
      if vim.fn.isdirectory(mason_path) == 0 then
        vim.notify("Could not locate jdtls install under Mason path.", vim.log.levels.ERROR)
        return
      end

      -- Determine OS-specific config folder
      local os_config
      if vim.fn.has("macunix") == 1 then
        os_config = "config_mac"
      elseif vim.fn.has("unix") == 1 then
        os_config = "config_linux"
      elseif vim.fn.has("win32") == 1 then
        os_config = "config_win"
      else
        vim.notify("Unsupported OS for JDTLS", vim.log.levels.ERROR)
        return
      end

      -- Workspace per project
      local home = os.getenv("HOME") or os.getenv("USERPROFILE")
      local root_dir = require("jdtls.setup").find_root({
        ".git",
        ".project",
        ".classpath",
        "mvnw",
        "gradlew",
        "pom.xml",
        "settings.gradle",
        "settings.gradle.kts",
        "build.gradle",
        "build.gradle.kts",
      })

      local workspace_dir
      if root_dir and root_dir ~= "" then
        workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":t")
      else
        workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      end

      -- Find the actual launcher JAR dynamically
      local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar", true)
      if launcher_jar == "" then
        vim.notify("Could not find JDTLS launcher JAR in Mason path", vim.log.levels.ERROR)
        return
      end

      local jdtls = require("jdtls")

      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          launcher_jar,
          "-configuration",
          mason_path .. "/" .. os_config,
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {
            eclipse = { downloadSources = true },
            configuration = { updateBuildConfiguration = "interactive" },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            format = { enabled = true },
          },
        },
        init_options = { bundles = {} },
      }

      jdtls.start_or_attach(config)
    end,
  },
}
