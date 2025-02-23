local M = {
  "olimorris/persisted.nvim",
  config = true
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save Session" },
    { "<leader>sd", "<cmd>SessionStop<cr>", desc = "Stop Session" },
  --   { "<leader>sl", "<cmd>SessionLoadLast<cr>", desc = "Load Last" },
    { "<leader>sf", "<cmd>Telescope persisted<cr>", desc = "Find Session" },
  }

  require("persisted").setup {
    save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
    silent = false, -- silent nvim message when sourcing session file
    use_git_branch = false, -- create session files based on the branch of a git enabled repository
    default_branch = "main", -- the branch to load if a session file is not found for the current branch
    autosave = true, -- automatically save session files when exiting Neovim
    should_autosave = function()
      -- do not autosave if the alpha dashboard is the current filetype
      if vim.bo.filetype == "alpha" then
        return false
      end
      return true
    end,
    autoload = true, -- automatically load the session for the cwd on Neovim startup
    on_autoload_no_session = function()
      vim.notify("No existing session to load.")
    end,
    follow_cwd = true, -- change session file name to match current working directory if it changes
    -- allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
    allowed_dirs = {
      "~/.dotfiles",
      "~/work",
    },
    ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
    ignored_branches = nil, -- table of branch patterns that are ignored for auto-saving and auto-loading
    telescope = {
      reset_prompt = true, -- Reset the Telescope prompt after an action?
      mappings = { -- table of mappings for the Telescope extension
        change_branch = "<c-b>",
        copy_session = "<c-c>",
        delete_session = "<c-d>",
      },
      icons = { -- icons displayed in the picker, set to nil to disable entirely
        branch = " ",
        dir = " ",
        selected = " ",
      },
    },
  }

  -- local group = vim.api.nvim_create_augroup("PersistedHooks", {})

  -- vim.api.nvim_create_autocmd({ "User" }, {
  --   pattern = "PersistedTelescopeLoadPre",
  --   group = group,
  --   callback = function(session)
  --     -- Save the currently loaded session using a global variable
  --     require("persisted").save({ session = vim.g.persisted_loaded_session })
  --
  --     -- Delete all of the open buffers
  --     vim.api.nvim_input("<ESC>:%bd!<CR>")
  --   end,
  -- })
end

return M
