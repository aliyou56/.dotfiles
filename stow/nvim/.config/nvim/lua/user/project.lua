local M = {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
}

function M.config()
  require("project_nvim").setup {
    active = true,
    on_config_done = nil,
    manual_mode = true,
    detection_methods = { "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    scope_chdir = "global",
  }

  function OpenRecentProject()
    local projects = require("project_nvim").get_recent_projects()
    local project_list = {}
    for i = 1, #projects do
      project_list[i] = projects[#projects + 1 - i]
    end
    local opts = {
      prompt = "Projects❯ ",
      no_multi = false,
      header_lines = 2,
      preview = {
        field_index = "{+}",
        title = "Files inside:",
        fn = function(path)
          local files = {}
          local handle = vim.loop.fs_scandir(path[1])
          if not handle then
            return nil, "Unable to open directoryL " .. path[1]
          end

          while true do
            local name, type = vim.loop.fs_scandir_next(handle)
            local icon =  "."
            if not name then
              break
            end
            -- include only files (not directories)
            if type == "directory" then
              icon = "?"
            end
            table.insert(files, icon .. " " .. name)
          end
          return files
        end
      },
      winopts = {
        height = #project_list + 2,
        width = 0.6,
        row = 0.4,
      },
      actions = {
        ["default"] = function(selected)
          require("fzf-lua").files({ cwd = selected[1] })
        end,
      }
    }
    require("fzf-lua").fzf_exec(project_list, opts)
  end

  -- local opts = { noremap = true, silent = true }
  -- local keymap = vim.api.nvim_set_keymap

  -- keymap("n", "<c-p>", ":lua require('telescope').extensions.projects.projects()<CR>", opts)
end

return M
