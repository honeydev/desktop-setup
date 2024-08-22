require("neoconf").setup({
  -- override any of the default settings here
}) metals_config = require'metals'.bare_config()
  metals_config.settings = {
     showImplicitArguments = true,
     excludedPackages = {
       "akka.actor.typed.javadsl",
       "com.github.swagger.akka.javadsl"
     },
--     javaHome="/nix/store/zmj3m7wrgqf340vqd4v90w8dw371vhjg-openjdk-17.0.7+7"
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
    name = "DIStage :web",
    metals = {
      runType = "runOrTestFile",
      mainClass = "sparkshow.SparkshowLauncher",
      args = { ":web" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
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
-- mason
require("lspconfig").pylsp.setup{}

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  })

require("mason").setup()

vim.keymap.set("n", "<leader>mn", "<cmd>:Mason<cr>")
vim.keymap.set("n", "<leader>mnu", "<cmd>:MasonUpdate<cr>")
------- dap-ui
local dap, dapui = require("dap"), require("dapui")

 dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "»" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              'scopes',
              -- 'breakpoints',
              'stacks',
              -- 'watches',
            },
            size = 40,
            position = 'left',
          },
          {
            elements = {
              'repl',
              --    'console',
            },
            size = 10,
            position = 'bottom',
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "rounded", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        controls = {
          -- Requires Neovim nightly (or 0.8 when released)
          enabled = false, -- because the icons don't work
          -- Display controls in this element
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
          },
        },
        windows = { indent = 1 },
      })


dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>duo", 
function () 
    require("dapui").open()
end)
vim.keymap.set("n", "<leader>duc", 
function () 
    require("dapui").close()
end)

vim.keymap.set("n", "<leader>dut", 
function () 
    require("dapui").toggle()       -- vim.keymap.set("n", "<leader>duc", require("dapui").close())
end)                               -- vim.keymap.set("n", "<leader>dut", require("dapui").toggle())
-- 

