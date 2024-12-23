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
    -- showImplicitArguments = true,
    -- showImplicitConversionsAndClasses = true,
    showInferredType = true,
    serverVersion = "latest.snapshot",
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }

  metals_config.init_options.statusBarProvider = "off" -- -> use fidget

  metals_config.capabilities = require("blink.cmp").get_lsp_capabilities()

  metals_config.on_attach = function(client, bufnr)
    -- require("metals").setup_dap()
    local map = vim.keymap.set
    require"user.lspconfig".lsp_keymaps(bufnr) -- common lsp keymaps

    map("n", "<leader>mc", metals.commands)
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

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.scala", "*.sc" },
    callback = function()
      vim.lsp.buf.format { async = true }
      vim.lsp.codelens.refresh()
      vim.lsp.codelens.refresh()
    end,
  })

end

return M
