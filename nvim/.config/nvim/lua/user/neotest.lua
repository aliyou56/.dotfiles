local status_ok, neotest = pcall(require, "neotest")
if not status_ok then return end

neotest.setup {
  adapters = {
    require("neotest-scala")({
      args = {"--no-color"},
      runner = "bloop", -- or sbt
      framework = "munit" -- utest|munit|scalatest
    }),
    require("neotest-python")({
      dap = { justMyCode = false },
      args = { "--log-level", "DEBUG" },
      runner = "pytest",
      -- python = ".venv/bin/python",
      -- is_test_file = funtion(file_path)
      -- end,
    })
  }
}
