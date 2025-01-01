return {
  settings = {
    yaml = {
      schemas = vim.tbl_deep_extend("force", require("schemastore").yaml.schemas(), {
        ["https://squidfunk.github.io/mkdocs-material/schema.json"] = { "mkdocs.yml" },
      }),
      -- schemas = {
      --   kubernetes = "k8s-*.yaml",
      --   ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
      --   ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --   ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
      --   ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
      --   ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
      --   ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
      --   ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
      -- },
      customTags = {
        "!ENV scalar",
        "!ENV sequence",
        "!relative scalar",
        "tag:yaml.org,2002:python/name:material.extensions.emoji.to_svg",
        "tag:yaml.org,2002:python/name:material.extensions.emoji.twemoji",
        "tag:yaml.org,2002:python/name:pymdownx.superfences.fence_code_format",
      },
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}
