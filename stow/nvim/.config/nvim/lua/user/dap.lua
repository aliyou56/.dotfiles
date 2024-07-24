local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
  },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc ="Step Back" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
    { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },
  }

  -- local dap = require "dap"
  -- dap.configurations.scala = {
  --   {
  --     type = "scala",
  --     request = "launch",
  --     name = "RunOrTest",
  --     metals = {
  --       runType = "runOrTestFile",
  --       -- args = { "firstArg", "secongArgs" }
  --     },
  --   },
  --   {
  --     type = "scala",
  --     request = "launch",
  --     name = "Test Target",
  --     metals = {
  --       runType = "testTarget",
  --     },
  --   },
  -- }
  --
  -- local dapui = require "dapui"
  -- dapui.setup {
  --   icons = { expanded = "▾", collapsed = "▸" },
  --   mappings = {
  --     -- Use a table to apply multiple mappings
  --     expand = { "<CR>", "<2-LeftMouse>" },
  --     open = "o",
  --     remove = "d",
  --     edit = "e",
  --     repl = "r",
  --     toggle = "t",
  --   },
  --   -- Expand lines larger than the window
  --   -- Requires >= 0.7
  --   expand_lines = vim.fn.has "nvim-0.7",
  --   -- Layouts define sections of the screen to place windows.
  --   -- The position can be "left", "right", "top" or "bottom".
  --   -- The size specifies the height/width depending on position. It can be an Int
  --   -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  --   -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  --   -- Elements are the elements shown in the layout (in order).
  --   -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  --   layouts = {
  --     {
  --       elements = {
  --         -- Elements can be strings or table with id and size keys.
  --         { id = "scopes", size = 0.25 },
  --         "breakpoints",
  --         -- "stacks",
  --         -- "watches",
  --       },
  --       size = 40, -- 40 columns
  --       position = "right",
  --     },
  --     {
  --       elements = {
  --         "repl",
  --         "console",
  --       },
  --       size = 0.25, -- 25% of total lines
  --       position = "bottom",
  --     },
  --   },
  --   floating = {
  --     max_height = nil, -- These can be integers or a float between 0 and 1.
  --     max_width = nil, -- Floats will be treated as percentage of your screen.
  --     border = "single", -- Border style. Can be "single", "double" or "rounded"
  --     mappings = {
  --       close = { "q", "<Esc>" },
  --     },
  --   },
  --   windows = { indent = 1 },
  --   render = {
  --     max_type_length = nil, -- Can be integer or nil.
  --   },
  -- }
  --
  -- local icons = require "user.icons"
  --
  -- vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })
  --
  -- dap.listeners.after.event_initialized["dapui_config"] = function()
  --   dapui.open {}
  -- end
  -- dap.listeners.before.event_terminated["dapui_config"] = function()
  --   dapui.close {}
  -- end
  -- dap.listeners.before.event_exited["dapui_config"] = function()
  --   dapui.close {}
  -- end
end

return M
