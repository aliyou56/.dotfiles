local status_ok, transparent = pcall(require, "nvim-transparent")
if not status_ok then
  return
end

transparent.setup {
  enable = true, -- enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared 
    -- In particular, when you set it to 'all', that means alla vailable groups
    "all"
    -- "BufferLineTabClose",
    -- "BufferlineBufferSelected",
    -- "BufferLineFill",
    -- "BufferLineBackground",
    -- "BufferLineSeparator",
    -- "BufferLineIndicatorSelected"
  },
  exclude = {} -- table; gorups you don't want to clear
}
