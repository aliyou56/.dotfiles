local M = {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local metals = require "metals"
  local metals_config = metals.bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      serverVersion = "latest.snapshot",
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    }

    metals_config.init_options.statusBarProvider = "off" -- -> use fidget

    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    metals_config.on_attach = function(client, bufnr)
      -- require("metals").setup_dap()
      local map = vim.keymap.set
      local lspconfig = require "user.lspconfig"
      lspconfig.lsp_keymaps(bufnr)

      -- map("n", "<leader>ws", function()
      --   metals.hover_worksheet()
      -- end)

      map("n", "<leader>mmc", metals.commands)
      map("n", "<leader>mc", "<cmd>:lua require'telescope'.extensions.metals.commands()<CR>")
      map("n", "<leader>mh", "<cmd>:lua require'metals'.hover_worksheet()<CR>")
      map("n", "<leader>mtt", require("metals.tvp").toggle_tree_view)
      map("n", "<leader>mtr", require("metals.tvp").reveal_in_tree)
      map("n", "<leader>mts", function()
        metals.toggle_setting("showImplicitArguments")
      end)
  end

  -- Autocmd that will actually be in charge of starting the whole thing
  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sc", "sbt", "java" },
    callback = function()
      metals.initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })
end


return M
