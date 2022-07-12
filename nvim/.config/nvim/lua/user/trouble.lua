
-- local status_ok, colors = pcall(require, "lsp-colors")
-- if not status_ok then
--   return
-- end

-- colors.setup({
--   Error = "#db4b4b",
--   Warning = "#e0af68",
--   Information = "#0db9d7",
--   Hint = "#10B981"
-- })

local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup()
