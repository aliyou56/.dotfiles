require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocommands"

if not vim.g.vscode then
spec "user.colorscheme"
spec "user.miniicons"
spec "user.treesitter"
spec "user.mason"
spec "user.schemastore"
spec "user.lspconfig"
spec "user.metals"
spec "user.lsp-saga"
spec "user.lsp-signature"
spec "user.opencode"
spec "user.none-ls"
spec "user.illuminate"
spec "user.lualine"
spec "user.whichkey"
-- spec "user.dap"
spec "user.blink-cmp"
spec "user.dadbod"
-- spec "user.comment"
spec "user.gitsigns"
spec "user.indentline"
spec "user.project"
spec "user.toggleterm"
spec "user.bufjump"
-- spec "user.kubectl"

-- Extras
spec "user.extras.colorizer"
spec "user.extras.snacks"
spec "user.extras.modicator"
spec "user.extras.bqf"
spec "user.extras.ufo"
-- spec "user.extras.nui"
-- spec "user.extras.surround"
-- spec "user.extras.eyeliner"
spec "user.extras.numb"
spec "user.extras.fidget"
spec "user.extras.neotab"
-- spec "user.extras.neotest"
spec "user.extras.tabby"
spec "user.extras.gitlinker"
spec "user.extras.harpoon"
spec "user.extras.trouble"
spec "user.extras.todo-comments"
-- spec "user.extras.persistence"
spec "user.extras.persisted"
spec "user.extras.rustacean"
spec "user.extras.crates"
spec "user.extras.endwise"
spec "user.extras.markdown"

require "user.lazy"
end

if vim.g.neovide then
  -- vim.o.guifont = "CaskaydiaCove Nerd Font:h14"
  vim.o.guifont = "FiraCode Nerd Font:h14"

  local function save() vim.cmd.write() end
  local function copy() vim.cmd([[normal! "+y]]) end
  local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end

  vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
  vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
  vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })
end
