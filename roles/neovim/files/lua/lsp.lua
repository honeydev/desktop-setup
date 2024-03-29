require("neoconf").setup({
  -- override any of the default settings here
})
  metals_config = require'metals'.bare_config()
  metals_config.settings = {
     showImplicitArguments = true,
     excludedPackages = {
       "akka.actor.typed.javadsl",
       "com.github.swagger.akka.javadsl"
     }
  }
  vim.g.mapleader = '\\'
  metals_config.on_attach = function()
    require'completion'.on_attach();
  end

  local line_num = 5
  local col_num = 5

  metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        spacing = 2,
        prefix = " 🔥 ",
        -- virt_text_pos = "overlay",
        -- source = "always"
      }
    }
  )

  local dap = require("dap")
  dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunMigrate",
    metals = {
      runType = "runOrTestFile",
      args = { "migrate" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "play",
    buildTarget = "play-test-build",
    metals = {
      mainClass = "app.Server",
      buildTarget = "play-test-build",
      runType = "run",
      args = {},
      jvmOptions = {"-Dconfig.file=/path/to/production.conf"}
    }
  }
}

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end

